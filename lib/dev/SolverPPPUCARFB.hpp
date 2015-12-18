#pragma ident "$Id: SolverPPPUCARFB.hpp 1914 2009-05-24 22:09:30Z architest $"

/**
 * @file SolverPPPUCARFB.hpp
 * Class to compute the PPP solution in forwards-backwards mode.
 */

#ifndef GPSTK_SOLVERPPPUCARFB_HPP
#define GPSTK_SOLVERPPPUCARFB_HPP

//============================================================================
//
//  This file is part of GPSTk, the GPS Toolkit.
//
//  The GPSTk is free software; you can redistribute it and/or modify
//  it under the terms of the GNU Lesser General Public License as published
//  by the Free Software Foundation; either version 2.1 of the License, or
//  any later version.
//
//  The GPSTk is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU Lesser General Public License for more details.
//
//  You should have received a copy of the GNU Lesser General Public
//  License along with GPSTk; if not, write to the Free Software Foundation,
//  Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
//
//  Shoujian ZHang, Wuhan University, 2015
//
//============================================================================


#include "SolverPPPUCAR.hpp"
#include <list>
#include <set>


namespace gpstk
{

      /** @addtogroup GPSsolutions */
      /// @ingroup math

      //@{

      /** This class computes the Precise Point Positioning (PPP) solution
       *  using a Kalman solver that combines the raw observations. 
       *
       *  Also, this class uses the 'forwards-backwards'*  approach, 
       *  where the provided data set is processed from 'past to
       *  future' and from 'future to past' several times.
       *
       * This approach improves the final solution because it takes advantage
       * of a better phase ambiguity resolution. On the other hand, it is only
       * applicable in post-process mode (of course).
       *
       * In reality, "SolverPPPUCARFB.hpp" objects are really "SolverPPPUCAR.hpp"
       * objects at their core, with some wrapper code that takes 'normal'
       * forwards input data, stores them, and feeds the internal "SolverPPPUCAR"
       * object with a continuous data stream formed by several instances of
       * forwards input data, "mirrored" input data (oldest is newest and
       * viceversa), forwards input data again, and so on.
       *
       * In order to achieve this, SolverPPPUCARFB.hpp" objects work in three
       * distinct phases:
       *
       *    \li Initial "Process()" phase: This does a "normal" forward
       *        processing, like the "SolverPPPUCAR.hpp" objects. Data feed during
       *        this phase are internally stored for later phases.
       *    \li "ReProcess()" phase: In this phase the filter will process the
       *        stored data in "backwards-forwards" fashion as many times as
       *        set by the provided "cycles" parameter (by default, "cycles" is
       *        equal to 1). This phase always ends in backwards processing.
       *    \li "LastProcess()" phase: This is the last phase and it is always
       *        done in forwards mode. During this phase you will get your
       *        final results.
       *
       * Take due note that the "SolverPPPUCARFB.hpp" class is designed to be used
       * ONLY with GNSS data structure objects from "DataStructures" class.
       *
       * A typical way to use this class follows:
       *
       * @code
       *      // INITIALIZATION PART
       *
       *      // EBRE station nominal position
       *   Position nominalPos(4833520.192, 41537.1043, 4147461.560);
       *   RinexObsStream rin("ebre0300.02o");  // Data stream
       *
       *      // Load all the SP3 ephemerides files
       *   SP3EphemerisStore SP3EphList;
       *   SP3EphList.loadFile("igs11512.sp3");
       *   SP3EphList.loadFile("igs11513.sp3");
       *   SP3EphList.loadFile("igs11514.sp3");
       *
       *   NeillTropModel neillTM( nominalPos.getAltitude(),
       *                           nominalPos.getGeodeticLatitude(),
       *                           30 );
       *
       *      // Objects to compute the tropospheric data
       *   BasicModel basicM(nominalPos, SP3EphList);
       *   ComputeTropModel computeTropo(neillTM);
       *
       *      // More declarations here: ComputeMOPSWeights, SimpleFilter,
       *      // LICSDetector, MWCSDetector, SolidTides, OceanLoading, 
       *      // PoleTides, CorrectObservables, ComputeWindUp, ComputeLinear,
       *      // LinearCombinations, etc.
       *
       *      // Declare a SolverPPPUCARFB object
       *   SolverPPPUCARFB pppSolver;
       *
       *     // PROCESSING PART
       *
       *   gnssRinex gRin;
       *
       *      // --->>> Process() phase <<<--- //
       *
       *   while(rin >> gRin)
       *   {
       *      try
       *      {
       *         gRin  >> basicM
       *               >> correctObs
       *               >> compWindup
       *               >> computeTropo
       *               >> linear1      // Compute combinations
       *               >> pcFilter
       *               >> markCSLI2
       *               >> markCSMW
       *               >> markArc
       *               >> linear2      // Compute prefit residuals
       *               >> phaseAlign
       *               >> pppSolver;
       *      }
       *      catch(...)
       *      {
       *         cerr << "Unknown exception at epoch: " << time << endl;
       *         continue;
       *      }
       *
       *   }   // End of 'while(rin >> gRin)'
       *
       *
       *      // --->>> ReProcess() phase <<<--- //
       *
       *   try
       *   {
       *
       *         // Now, let's do the forward-backward cycles (4)
       *      pppSolver.ReProcess(4);
       *
       *   }
       *   catch(Exception& e)
       *   {
       *      cerr << "Exception: " << e << endl;
       *   }
       *
       *
       *      // --->>> LastProcess() phase <<<--- //
       *
       *      // Loop over all data epochs, again
       *   while( pppSolver.LastProcess(gRin) )  // True while there are data
       *   {
       *
       *         // In this case, gRin is an output from 'LastProcess()'
       *      DayTime time(gRin.header.epoch);
       *
       *         // Print results
       *      cout << time.DOYsecond() << "  ";     // Epoch - Output field #1
       *
       *      cout << pppSolver.getSolution(TypeID::dLat) << "  "; // dLat - #2
       *      cout << pppSolver.getSolution(TypeID::dLon) << "  "; // dLon - #3
       *      cout << pppSolver.getSolution(TypeID::dH) << "  ";   // dH   - #4
       *      cout << pppSolver.getSolution(TypeID::wetMap) << "  "; // Tropo-#5
       *
       *   }
       * @endcode
       *
       * The "SolverPPPUCARFB" object will also insert back postfit residual data
       * (both code and phase) into "gRin" if it successfully solves the
       * equation system.
       *
       * By default, it will build the geometry matrix from the values of
       * coefficients wetMap, dx, dy, dz and cdt, IN THAT ORDER. Please note
       * that the first field of the solution will be the estimation of the
       * zenital wet tropospheric component (or at least, the part that wasn't
       * modeled by the tropospheric model used).
       *
       * You may configure the solver to work with a NEU system in the class
       * constructor or using the "setNEU()" method.
       *
       * In any case, the "SolverPPPUCARFB" object will also automatically add and
       * estimate the ionosphere-free phase ambiguities. The independent vector
       * is composed of the code and phase prefit residuals.
       *
       * This class expects some weights assigned to each satellite. That can
       * be achieved with objects from classes such as "ComputeIURAWeights",
       * "ComputeMOPSWeights", etc.
       *
       * If these weights are not assigned, then the "SolverPPPUCARFB" object will
       * set a value of "1.0" to code measurements, and "weightFactor" to phase
       * measurements. The default value of "weightFactor" is "10000.0". This
       * implies that code sigma is 1 m, and phase sigma is 1 cm.
       *
       * By default, the stochastic models used for each type of variable are:
       *
       *    \li Coordinates are modeled as constants (StochasticModel).
       *    \li Zenital wet tropospheric component is modeled as a random walk
       *        (RandomWalkModel), with a qPrime value of 3e-8 m*m/s.
       *    \li Receiver clock is modeled as white noise (WhiteNoiseModel).
       *    \li Phase biases are modeled as white noise when cycle slips
       *        happen, and as constants between cycle slips
       *        (PhaseAmbiguityModel).
       *
       * You may change this assignment with methods "setCoordinatesModel()",
       * "setTroposphereModel()" and "setReceiverClockModel()". However, you
       * are not allowed to change the phase biases stochastic model.
       *
       * Given the nature of this solver, it is possible for it to trim data
       * according to some preset postfit residuals limits, deleting out
       * potential outliers.
       *
       * The former is achieved by setting a couple lists of limits (one for
       * code postfit residuals and the other for phase ones) that will be
       * applied, one forward-backward cycle for each, in the same order they
       * where added. One code limit and one phase limit are applied
       * simultaneously per cycle.
       *
       * In this case you must call the "ReProcess(void)" method instead of the
       * "ReProcess(int)" method.
       *
       * A way to apply this feature follows:
       *
       * @code
       *      // INITIALIZATION PART
       *
       *      // INITIALIZATION CODE HERE...
       *
       *      // Declare a SolverPPPUCARFB object
       *   SolverPPPUCARFB pppSolver;
       *
       *      // Add limits to solver. Let's start with pseudorange limits
       *   pppSolver.addCodeLimit(10.0);     // 10 m
       *   pppSolver.addCodeLimit(5.0);      //  5 m
       *   pppSolver.addCodeLimit(2.0);      //  2 m
       *
       *      // Now, let's follow with phase limits
       *   pppSolver.addPhaseLimit(0.10);    // 10 cm
       *   pppSolver.addPhaseLimit(0.05);    //  5 cm
       *   pppSolver.addPhaseLimit(0.02);    //  2 cm
       *
       *      // PROCESSING PART CODE HERE...
       *
       *
       *      // --->>> ReProcess() phase <<<--- //
       *
       *   try
       *   {
       *
       *         // Now, let's do the forward-backward cycles.
       *         // Please note that this method needs no parameters.
       *         // Three forwards-backwards cycles will be made because
       *         // maximum limits list size is 3.
       *      pppSolver.ReProcess();
       *
       *   }
       *   catch(Exception& e)
       *   {
       *      cerr << "Exception: " << e << endl;
       *   }
       *
       *
       *      // LastProcess() PHASE CODE HERE ...
       *
       * @endcode
       *
       * \warning "SolverPPPUCARFB" is based on a Kalman filter, and Kalman filters
       * are objets that store their internal state, so you MUST NOT use the
       * SAME object to process DIFFERENT data streams.
       *
       * @sa SolverBase.hpp, SolverLMS.hpp, CodeKalmanSolver.hpp and
       * SolverPPP.hpp for base classes.
       *
       */
   class SolverPPPUCARFB : public SolverPPPUCAR
   {
   public:

         /** Common constructor.
          *
          * @param useNEU   If true, will compute dLat, dLon, dH coordinates;
          *                 if false (the default), will compute dx, dy, dz.
          */
      SolverPPPUCARFB(bool useNEU = false);


         /** Returns a reference to a gnnsSatTypeValue object after
          *  solving the previously defined equation system.
          *
          * @param gData    Data object holding the data.
          */
      virtual gnssSatTypeValue& Process(gnssSatTypeValue& gData)
         throw(ProcessingException, SVNumException);


         /** Returns a reference to a gnnsRinex object after solving
          *  the previously defined equation system.
          *
          * @param gData    Data object holding the data.
          */
      virtual gnssRinex& Process(gnssRinex& gData)
         throw(ProcessingException, SVNumException);


         /** Reprocess the data stored during a previous 'Process()' call.
          *
          * @param cycles     Number of forward-backward cycles (1 by default).
          *
          * \warning The minimum number of cycles allowed is "1". In fact, if
          * you introduce a smaller number, 'cycles' will be set to "1".
          */
      virtual void ReProcess( int cycles )
         throw(ProcessingException, SVNumException);


         /** Reprocess the data stored during a previous 'Process()' call.
          *
          * This method will reprocess data trimming satellites whose postfit
          * residual is bigger than the limits indicated by limitsCodeList and
          * limitsPhaseList.
          */
      virtual void ReProcess( void )
         throw(ProcessingException, SVNumException);


         /** Process the data stored during a previous 'ReProcess()' call, one
          *  item at a time, and always in forward mode.
          *
          * @param gData      Data object that will hold the resulting data.
          *
          * @return FALSE when all data is processed, TRUE otherwise.
          */
      virtual bool LastProcess(gnssSatTypeValue& gData)
         throw(ProcessingException, SVNumException);


         /** Process the data stored during a previous 'ReProcess()' call, one
          *  item at a time, and always in forward mode.
          *
          * @param gData      Data object that will hold the resulting data.
          *
          * @return FALSE when all data is processed, TRUE otherwise.
          */
      virtual bool LastProcess(gnssRinex& gData)
         throw(ProcessingException, SVNumException);


         /// Gets the list storing the limits for postfit residuals in code.
      virtual std::list<double> getCodeList( void ) const
      { return limitsCodeList; };


         /** Sets a list storing the limits for postfit residuals in code.
          *
          * @param codeList   List with limits for postfit residuals in code.
          *
          * \warning Limits will be applied in the same order they were added.
          */
      virtual SolverPPPUCARFB& setCodeList( std::list<double> codeList )
      { limitsCodeList = codeList; return (*this); };


         /** Adds a postfit residuals limit to list storing limits for code.
          *
          * @param codeLimit   New limit for postfit residuals in code.
          *
          * \warning Limits will be applied in the same order they were added.
          */
      virtual SolverPPPUCARFB& addCodeLimit( double codeLimit )
      { limitsCodeList.push_back( codeLimit ); return (*this); };


         /// Clears the list storing the limits for postfit residuals in code.
      virtual SolverPPPUCARFB& clearCodeList( void )
      { limitsCodeList.clear(); return (*this); };


         /// Gets the list storing the limits for postfit residuals in phase.
      virtual std::list<double> getPhaseList( void ) const
      { return limitsPhaseList; };


         /** Sets a list storing the limits for postfit residuals in phase.
          *
          * @param phaseList   List with limits for postfit residuals in phase.
          *
          * \warning Limits will be applied in the same order they were added.
          */
      virtual SolverPPPUCARFB& setPhaseList( std::list<double> phaseList )
      { limitsPhaseList = phaseList; return (*this); };


         /** Adds a postfit residuals limit to list storing limits for phase.
          *
          * @param phaseLimit   New limit for postfit residuals in phase.
          *
          * \warning Limits will be applied in the same order they were added.
          */
      virtual SolverPPPUCARFB& addPhaseLimit( double phaseLimit )
      { limitsPhaseList.push_back( phaseLimit ); return (*this); };


         /// Clears the list storing the limits for postfit residuals in phase.
      virtual SolverPPPUCARFB& clearPhaseList( void )
      { limitsPhaseList.clear(); return (*this); };


         /// Returns the number of processed measurements.
      virtual int getProcessedMeasurements(void) const
      { return processedMeasurements; };


         /// Returns the number of measurements rejected because they were
         /// off limits.
      virtual int getRejectedMeasurements(void) const
      { return rejectedMeasurements; };


         /** Set a single coordinates stochastic model to ALL coordinates.
          *
          * @param pModel      Pointer to StochasticModel associated with
          *                    coordinates.
          *
          * @warning Do NOT use this method to set the SAME state-aware
          * stochastic model (like RandomWalkModel, for instance) to ALL
          * coordinates, because the results will certainly be erroneous. Use
          * this method only with non-state-aware stochastic models like
          * 'StochasticModel' (constant coordinates) or 'WhiteNoiseModel'.
          */
      virtual SolverPPPUCARFB& setCoordinatesModel(StochasticModel* pModel)
      { SolverPPPUCAR::setCoordinatesModel(pModel); return (*this); };


         /** Sets if a NEU system will be used.
          *
          * @param useNEU  Boolean value indicating if a NEU system will
          *                be used
          *
          */
      virtual SolverPPPUCARFB& setNEU( bool useNEU );


         /// Returns an index identifying this object.
      virtual int getIndex(void) const;


         /// Returns a string identifying this object.
      virtual std::string getClassName(void) const;


         /// Destructor.
      virtual ~SolverPPPUCARFB() {};


   private:


         /// Boolean indicating if this is the first iteration of this filter.
      bool firstIteration;


         /// List holding the information regarding every observation.
      std::list<gnssRinex> ObsData;


         /// Set storing the TypeID's that we want to keep.
      TypeIDSet keepTypeSet;


         /// Number of processed measurements.
      int processedMeasurements;


         /// Number of measurements rejected because they were off limits.
      int rejectedMeasurements;


         /// List storing the limits for postfit residuals in code.
      std::list<double> limitsCodeList;


         /// List storing the limits for postfit residuals in phase.
      std::list<double> limitsPhaseList;


         /// Initial index assigned to this class.
      static int classIndex;


         /// This method checks the limits and modifies 'gData' accordingly.
      void checkLimits( gnssRinex& gData, double codeLimit, double phaseLimit );


         /// Index belonging to this object.
      int index;

         /// Sets the index and increment classIndex.
      void setIndex(void)
      { index = classIndex++; };

   }; // End of class 'SolverPPPUCARFB'


      //@}

}  // End of namespace gpstk

#endif   // GPSTK_SOLVERPPPUCARFB_HPP
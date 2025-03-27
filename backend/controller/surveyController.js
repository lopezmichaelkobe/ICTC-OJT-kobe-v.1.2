const Survey = require("../model/surveyModel");

const surveyController = {
    createSurvey: async (req, res) => {
        try {
            const { title, description, sections } = req.body;
            if (!title || !description || !sections || sections.length === 0) {
                return res.status(400).json({ message: "Title, description, and sections are required." });
            }

            const newSurvey = await Survey.createSurveyWithQuestions(title, description, sections);
            res.status(201).json({ message: "Survey created successfully", survey: newSurvey });
        } catch (error) {
            console.error("Error creating survey:", error);
            res.status(500).json({ message: "Internal server error" });
        }
    },

    getAllSurveys: async (req, res) => {
        try {
            const surveys = await Survey.getAllSurveys();
            res.json(surveys);
        } catch (error) {
            console.error("Error fetching surveys:", error);
            res.status(500).json({ message: "Internal server error" });
        }
    },

    getSurveyById: async (req, res) => {
        try {
            const { id } = req.params;
            const survey = await Survey.getSurveyById(id);

            if (!survey.id) {
                return res.status(404).json({ message: "Survey not found" });
            }

            res.json(survey);
        } catch (error) {
            console.error("Error fetching survey:", error);
            res.status(500).json({ message: "Internal server error" });
        }
    },

    getAllSurveysWithDetails: async (req, res) => {
        try {
            const surveys = await Survey.getAllSurveysWithDetails(); // Fix here
    
            if (!surveys || surveys.length === 0) {
                return res.status(404).json({ message: "No surveys found with details." });
            }
    
            res.json(surveys);
        } catch (error) {
            console.error("Error fetching surveys with details:", error);
            res.status(500).json({ message: "Internal server error" });
        }
    },    

    updateSurveyStatus: async (req, res) => {
        try {
          const { id } = req.params;
          const { status } = req.body;
      
          if (typeof status !== 'boolean') { // Ensure status is a boolean
            return res.status(400).json({ message: "Status must be a boolean" });
          }
      
          const updatedSurvey = await Survey.updateSurveyStatus(id, status);
      
          if (!updatedSurvey) {
            return res.status(404).json({ message: "Survey not found" });
          }
      
          res.json({ message: "Survey status updated successfully", survey: updatedSurvey });
        } catch (error) {
          console.error("Error updating survey status:", error);
          res.status(500).json({ message: "Internal server error" });
        }
      },

    getAllSurveysWithSections: async (req, res) => {
        try {
            const surveys = await Survey.getAllSurveysWithSections();
            res.json(surveys);
        } catch (error) {
            console.error("Error fetching surveys with sections:", error);
            res.status(500).json({ message: "Internal server error" });
        }
    },

    
    // Controller: updateSurveyDetails
    updateSurveyDetails: async (req, res) => {
        try {
            const { surveyId } = req.params; // Get survey ID from URL
            const { title, description, sections } = req.body; // Get updated data

            console.log("Received request to update survey:");
            console.log("Survey ID:", surveyId);
            console.log("Request body:", req.body);

            if (!title || !description || !Array.isArray(sections)) {
                console.log("Invalid request data:", { title, description, sections });
                return res.status(400).json({ message: "Invalid request data" });
            }

            console.log("Preparing to update survey with the following details:");
            console.log("Title:", title);
            console.log("Description:", description);
            console.log("Sections:", JSON.stringify(sections, null, 2)); // Pretty-print sections

            console.log("Updating survey with new details...");

            const updatedSurvey = await Survey.updateSurveyDetails(surveyId, title, description, sections);

            console.log("Update function response:", updatedSurvey); // Log raw result

            if (!updatedSurvey) {
                console.log("Survey update failed for ID:", surveyId);
                return res.status(400).json({ message: "Survey update failed" });
            }

            console.log("Survey updated successfully:", updatedSurvey);

            return res.json({ message: "Survey updated successfully", survey: updatedSurvey });
        } catch (error) {
            console.error("Error updating survey:", error);
            return res.status(500).json({ message: "Internal server error", error: error.message });
        }
    },


    deleteSurvey: async (req, res) => {
        try {
            const { surveyId } = req.params; // Get survey ID from request parameters
            const result = await Survey.deleteSurvey(surveyId);
            res.status(200).json(result);
        } catch (error) {
            console.error("Error deleting survey:", error);
            res.status(500).json({ message: "Internal server error" });
        }
    }
};

module.exports = surveyController;

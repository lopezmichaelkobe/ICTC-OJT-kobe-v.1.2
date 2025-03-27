import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom'; 
import Navbar from '../global/NavBar';
import AdminSidebar from '../global/AdminSideBar';
import FormsBuilder from './formbuilder';
import './AddSurvey.css';
import axios from 'axios';

function AddSurvey() {
    const [formData, setFormData] = useState(null);
    const navigate = useNavigate(); 


    const handleSaveForm = async () => {
      console.log("Original Form Data:", formData.sections);
  
      if (!formData || !formData.surveyTitle || !formData.surveyDescription || !formData.sections?.length) {
          alert("Title, description, and at least one section are required!");
          return;
      }
  
      const surveyTitle = formData.surveyTitle.trim() || "Untitled Survey";
      const surveyDescription = formData.surveyDescription.trim() || "No Description";
  
      const sections = formData.sections.map(section => ({
          title: section.title || "Untitled Section",
          description: section.description !== undefined ? section.description.trim() : "No description",
          questions: (section.elements || []).map(el => ({
              text: el.text || el.question || "Untitled Question",
              type: el.type || "text",
              isrequired: el.isrequired, // Ensure isrequired is passed correctly
              options: (el.options || []).map(opt => ({ text: opt || "" }))
          })),
      }));
  
      const payload = {
          title: surveyTitle,
          description: surveyDescription,
          sections,
      };
  
      console.log("Transformed Form Data:", JSON.stringify(payload, null, 2)); // Debugging check
  
      try {
          const response = await axios.post("http://localhost:5000/api/surveys/create", payload, {
              headers: { "Content-Type": "application/json" },
          });
  
          console.log(response.data.message);
  
          // Save the token if it exists
          const token = localStorage.getItem("token");
          
          // Clear all localStorage except the token
          localStorage.clear();
          if (token) {
              localStorage.setItem("token", token);
          }
  
          alert("Survey saved successfully!");
          setFormData(null); // This will clear form builder if it supports reset
          navigate("/managesurvey");
      } catch (error) {
          console.error("Error saving survey:", error.response?.data || error.message);
          alert(error.response?.data?.message || "Failed to save the survey.");
      }
  };

    return (
      <div style={{ minHeight: '100vh', display: 'flex', flexDirection: 'column' }}>
        <Navbar />
        <div className="d-flex" style={{ flex: 1 }}>
          <AdminSidebar />
          <div className="w-100 p-3 d-flex flex-column">
            <div className="d-flex justify-content-between align-items-center mb-3 survey-header">
              <h2 className="font-inter">Add Survey</h2>
              <div className="button-container"> 
                <button className="btn" onClick={handleSaveForm}>Save Form</button>
              </div>
            </div>
            <FormsBuilder onSave={setFormData} />
          </div>
        </div>
      </div>
    );
}

export default AddSurvey;
import React from 'react'
import './App.css'
import HomePage from './components/HomePage'
import AboutUs from './components/AboutUs'
import OurSolution from './components/OurSolution'
import Team from './components/Team'
import HowToUse from './components/HowToUse'
import ImpactAndStories from './components/ImpactAndStories'
import GetInvolved from './components/GetInvolved'
import FAQs from './components/FAQs'
import ContactUs from './components/ContactUs'
import Footer from './components/Footer'
function App() {
  return (
    <>
    <HomePage/>
    <AboutUs/>
    <OurSolution/>
    <Team/>
    <HowToUse/>
    <ImpactAndStories/>
    <GetInvolved/>
    <FAQs/>
    <ContactUs/>
    <Footer/>
    </>
  )
}

export default App
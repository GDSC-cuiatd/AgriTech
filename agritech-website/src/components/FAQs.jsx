import React from 'react';
import { Box, Typography, Container, Accordion, AccordionSummary, AccordionDetails } from '@mui/material';
import ExpandMoreIcon from '@mui/icons-material/ExpandMore';

const faqs = [
  { question: "How does the AgriTech solution work?", answer: "AgriTech uses AI and drones to detect crop diseases in real-time, providing farmers with actionable insights." },
  { question: "Is the AgriTech app free to use?", answer: "Yes, our mobile app is free for farmers, aligning with our mission to support sustainable agriculture." },
  // Add more FAQs as needed
];

const FAQs = () => {
  return (
    <Container maxWidth="lg">
      <Box py={6}>
        <Typography variant="h3" gutterBottom align="center">
          FAQs
        </Typography>
        {faqs.map((faq, index) => (
          <Accordion key={index}>
            <AccordionSummary expandIcon={<ExpandMoreIcon />}>
              <Typography>{faq.question}</Typography>
            </AccordionSummary>
            <AccordionDetails>
              <Typography>
                {faq.answer}
              </Typography>
            </AccordionDetails>
          </Accordion>
        ))}
      </Box>
    </Container>
  );
};

export default FAQs;

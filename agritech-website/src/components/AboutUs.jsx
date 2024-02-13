import React from 'react';
import { Box, Typography, Container, Grid, Paper } from '@mui/material';
import { styled } from '@mui/material/styles';
import Image2 from '../assets/Images/image-2.jpg'
import sgd1 from '../assets/Icons/sdg_1.png'
import sgd2 from '../assets/Icons/sgd_2.png'
import sgd3 from '../assets/Icons/sdg_3.png'
import sgd4 from '../assets/Icons/sdg_4.png'
// Custom Paper component to ensure equal height boxes
const EqualHeightPaper = styled(Paper)(({ theme }) => ({
  display: 'flex',
  flexDirection: 'column',
  justifyContent: 'space-between',
  padding: theme.spacing(2),
  height: '100%',
}));

const AboutUs = () => {
  return (
    <Container id='learn-more' maxWidth="lg">
      <Box py={6} sx={{ textAlign: 'center' }}>
        <Typography variant="h3" gutterBottom>
          About AgriTech
        </Typography>
        <Grid container spacing={3} alignItems="stretch">
          {/* Project Details with Background Image */}
          <Grid item xs={12} md={6}>
            <EqualHeightPaper elevation={3} 
            sx={{
                padding: 2,
                backgroundImage:  `url(${Image2})`,
                backgroundSize: 'cover',
                backgroundPosition: 'center',
                transition: 'transform 0.5s ease',
                '&:hover': {
                  transform: 'scale(1.05)', // Zoom in effect
                },
                color: '#fff',
                display: 'flex',
                flexDirection: 'column',
                justifyContent: 'space-between',
                height: '100%',
                cursor: 'pointer'
              }}
            >
              <Typography variant="h5" gutterBottom>
                Project Details
              </Typography>
              <Typography paragraph>
                In Pakistan, crop diseases pose a significant threat, leading to substantial annual losses. AgriTech introduces an AI-based solution to tackle this challenge, integrating drones, Raspberry Pi, and TensorFlow for advanced disease detection and monitoring. This innovative approach enables real-time, precise diagnosis of crop health, drastically reducing losses and improving agricultural productivity.
              </Typography>
            </EqualHeightPaper>
          </Grid>

          {/* SDG Alignment with Icons in a Row */}
          <Grid item xs={12} md={6}>
            <EqualHeightPaper elevation={3}
             sx={{
                padding: 2,
                transition: 'transform 0.5s ease',
                '&:hover': {
                  transform: 'scale(1.03)', // Scale up effect
                },
                height: '100%',
                cursor: 'pointer'
              }}
            >
              <Typography variant="h5" gutterBottom>
                SDG Alignment
              </Typography>
              <Box>
                <Grid container spacing={2} alignItems="center">
                  <Grid item xs={3}>
                  <Box
      component="img"
      src={sgd1}
      sx={{
        height: 44, // or the size you want
        width: 44, // maintain aspect ratio
        '&:hover': {
          transform: 'scale(1.5)', // Zoom in effect
        },
        transition: 'transform 0.6s ease-in-out',
                cursor: 'pointer'
      }}
      alt="Custom Icon"
    />{/* SDG 01 Icon */}
                  </Grid>
                  <Grid item xs={9}>
                    <Typography><strong>SDG 01 (No Poverty):</strong> By improving crop health and reducing losses, we enhance farmer livelihoods.</Typography>
                  </Grid>
                  <Grid item xs={3}>
                  <Box
      component="img"
      src={sgd2}
      sx={{
        height: 44, // or the size you want
        width: 44, // maintain aspect ratio
        '&:hover': {
          transform: 'scale(1.5)', // Zoom in effect
        },
        transition: 'transform 0.6s ease-in-out',
                cursor: 'pointer'
      }}
      alt="Custom Icon"
    /> {/* SDG 02 Icon */}
                  </Grid>
                  <Grid item xs={9}>
                    <Typography><strong>SDG 02 (Zero Hunger):</strong> Our solution minimizes crop destruction due to diseases, contributing to food security.</Typography>
                  </Grid>
                  <Grid item xs={3}>
                  <Box
      component="img"
      src={sgd3}
      sx={{
        height: 44, // or the size you want
        width: 44, // maintain aspect ratio
        '&:hover': {
          transform: 'scale(1.5)', // Zoom in effect
        },
        transition: 'transform 0.6s ease-in-out',
                cursor: 'pointer'
      }}
      alt="Custom Icon"
    /> {/* SDG 03 Icon */}
                  </Grid>
                  <Grid item xs={9}>
                    <Typography><strong>SDG 03 (Good Health and Well-Being):</strong> We promote safer farming practices by reducing reliance on harmful pesticides.</Typography>
                  </Grid>
                  <Grid item xs={3}>
                  <Box
      component="img"
      src={sgd4}
      sx={{
        height: 44, // or the size you want
        width: 44, // maintain aspect ratio
        '&:hover': {
          transform: 'scale(1.5)', // Zoom in effect
        },
        transition: 'transform 0.6s ease-in-out',
                cursor: 'pointer'
      }}
      alt="Custom Icon"
    />{/* SDG 12 Icon */}
                  </Grid>
                  <Grid item xs={9}>
                    <Typography><strong>SDG 12 (Responsible Consumption and Production):</strong> AgriTech optimizes resource use, promoting sustainability in agriculture.</Typography>
                  </Grid>
                </Grid>
              </Box>
            </EqualHeightPaper>
          </Grid>
        </Grid>
      </Box>
    </Container>
  );
};

export default AboutUs;

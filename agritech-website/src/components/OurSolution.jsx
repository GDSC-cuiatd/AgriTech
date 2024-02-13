import React from 'react';
import { Box, Typography, Container, Grid, Paper, CardMedia, List, ListItem, ListItemIcon, ListItemText } from '@mui/material';


import colab from '../assets/Icons/colab.jpg'
import tensor from '../assets/Icons/tensorFlow.svg'
import fluter from '../assets/Icons/fluter.png'
import firebase from '../assets/Icons/firebase.png'
import dbian from '../assets/Icons/Debian-logo.jpg'
import thony from '../assets/Icons/thony.png'
import drone from '../assets/Icons/drone.png'
import img_1 from '../assets/project/img-1.jpeg'
import img_3 from '../assets/project/img-3.jpeg'
import img_4 from '../assets/project/img-4.jpeg'
import capture from '../assets/Icons/capture.png'
import sent from '../assets/Icons/sent.png'
const OurSolution = () => {
  return (
    <Container maxWidth="lg">
      <Box py={6}>
        <Typography variant="h3" gutterBottom align="center">
          Our Solution
        </Typography>

        {/* Technology Overview Section */}
        <Grid container spacing={2}>
          <Grid item xs={12} md={6}>
            <Paper
              elevation={3}
              sx={{
                my: 2,
                p: 2,
                '&:hover': {
                  boxShadow: 6, // Increase shadow depth on hover
                },
                transition: 'box-shadow 0.3s ease-in-out',
              }}
            >
              <Typography variant="h4" gutterBottom>
                Technology Overview
              </Typography>
              <List>
                <ListItem>
                <ListItemIcon>
    {/* Replace 'path/to/your/icon.png' with the actual path to your custom icon */}
    <Box
      component="img"
      src={colab}
      sx={{
        height: 34, // or the size you want
        width: 34, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
  </ListItemIcon>
                  <ListItemText primary="Google COLAB: For collaborative AI model development and training." />
                </ListItem>
                <ListItem>
                <ListItemIcon>
                <Box
      component="img"
      src={tensor}
      sx={{
        height: 44, // or the size you want
        width: 44, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
     </ListItemIcon>
                  <ListItemText primary="TensorFlow: For building and deploying machine learning models that analyze crop images." />
                
                </ListItem>
                {/* Add other items similarly */}
                <ListItem>
                <ListItemIcon>
                <Box
      component="img"
      src={fluter}
      sx={{
        height: 24, // or the size you want
        width: 24, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
     </ListItemIcon>
                  <ListItemText primary="Flutter: To develop a cross-platform mobile application for farmers to monitor crop health." />
                
                </ListItem>


                <ListItem>
                <ListItemIcon>
                <Box
      component="img"
      src={firebase}
      sx={{
        height: 34, // or the size you want
        width: 34, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
     </ListItemIcon>
                  <ListItemText primary="Firebase: For real-time data storage, user authentication, and notifications." />
                </ListItem>
                <ListItem>
                <ListItemIcon>
                <Box
      component="img"
      src={dbian}
      sx={{
        height: 34, // or the size you want
        width: 34, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
     </ListItemIcon>
                  <ListItemText primary="Debian OS: Powers the Raspberry Pi for reliable in-field computations." />
                
                </ListItem>


                <ListItem>
                  <ListItemIcon>
                  <Box
      component="img"
      src={thony}
      sx={{
        height: 34, // or the size you want
        width: 34, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
                  </ListItemIcon>
                  <ListItemText primary="Thonny: An easy-to-use Python IDE for software development on Raspberry Pi." />
                
                </ListItem>
              </List>
            </Paper>
          </Grid>

          {/* Placeholder for System Workflow Image */}
          <Grid item xs={12} md={6}>
            <CardMedia
              component="img"
              height="140"
              image={img_3} // Replace with the path to your image
              alt="System Workflow"
              sx={{
                width: '100%', // Make sure the image takes the full width of the container
                maxHeight: '140px', // Maintain a fixed height
                objectFit: 'contain', // Ensure the full image is shown
                '&:hover': {
                  transform: 'scale(1.5)', // Zoom in effect
                },
                marginTop: '40px',
               marginBottom: '10px',
                transition: 'transform 0.6s ease-in-out',
                cursor: 'pointer'

              }}
            />
             <CardMedia
              component="img"
              height="140"
              image={img_1} // Replace with the path to your image
              alt="System Workflow"
              sx={{
                width: '100%', // Make sure the image takes the full width of the container
                maxHeight: '140px', // Maintain a fixed height
                objectFit: 'contain', // Ensure the full image is shown
                '&:hover': {
                  transform: 'scale(1.5)', // Zoom in effect
                },  
                marginTop: '30px',
                marginBottom: '10px',
                transition: 'transform 0.6s ease-in-out',
                cursor: 'pointer'
              }}
            />
              <CardMedia
              component="img"
              height="140"
              image={img_4} // Replace with the path to your image
              alt="System Workflow"
              sx={{
                width: '100%', // Make sure the image takes the full width of the container
                maxHeight: '140px', // Maintain a fixed height
                objectFit: 'contain', // Ensure the full image is shown
                '&:hover': {
                  transform: 'scale(1.5)', // Zoom in effect
                },
                transition: 'transform 0.6s ease-in-out',
                cursor: 'pointer',
                marginTop: '30px',
              }}
            />
          </Grid>
        </Grid>

        {/* System Workflow Section */}
        <Paper
          elevation={3}
          sx={{
            my: 2,
            p: 2,
            '&:hover': {
              transform: 'scale(1.02)', // Scale up effect
            },
            transition: 'transform 0.3s ease-in-out',
          }}
        >
          <Typography variant="h4" gutterBottom>
            System Workflow
          </Typography>
          <List>
            <ListItem>
              <ListItemIcon>
              <Box
      component="img"
      src={drone}
      sx={{
        height: 30, // or the size you want
        width: 30, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
              </ListItemIcon>
              <ListItemText primary="Drones equipped with high-resolution cameras capture images of the agricultural fields." />
            </ListItem>
            
            <ListItem>
              <ListItemIcon>
              <Box
      component="img"
      src={capture}
      sx={{
        height: 30, // or the size you want
        width: 30, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
              </ListItemIcon>
              <ListItemText primary="These images are processed in real-time using Raspberry Pi with TensorFlow models for disease detection." />
            </ListItem>
            <ListItem>
              <ListItemIcon>
              <Box
      component="img"
      src={sent}
      sx={{
        height: 30, // or the size you want
        width: 30, // maintain aspect ratio
      }}
      alt="Custom Icon"
    />
              </ListItemIcon>
              <ListItemText primary="The detected information is sent to the farmer's mobile app, developed with Flutter, providing immediate insights and recommendations." />
            </ListItem>
          </List>
        </Paper>
      </Box>
    </Container>
  );
};

export default OurSolution;

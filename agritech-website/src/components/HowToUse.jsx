import React from 'react';
import { Box, Typography, Container, Paper, List, ListItem, ListItemText, ListItemIcon } from '@mui/material';
import CheckCircleOutlineIcon from '@mui/icons-material/CheckCircleOutline';
import Image from '@mui/icons-material/Image'; // Placeholder for actual screenshots

const HowToUse = () => {
  return (
    <Container maxWidth="lg">
      <Box py={6}>
        <Typography variant="h3" gutterBottom align="center">
          How to Use
        </Typography>

        {/* For Farmers Section */}
        <Paper elevation={3} sx={{ my: 2, p: 2 }}>
          <Typography variant="h4" gutterBottom>
            For Farmers
          </Typography>
          <Typography paragraph>
            Follow these simple steps to monitor the health of your crops using our mobile app:
          </Typography>
          <List>
            <ListItem>
              <ListItemIcon>
                <CheckCircleOutlineIcon />
              </ListItemIcon>
              <ListItemText primary="Download and install the AgriTech app from your app store." />
            </ListItem>
            <ListItem>
              <ListItemIcon>
                <Image /> {/* Placeholder icon, replace with actual screenshot */}
              </ListItemIcon>
              <ListItemText primary="Open the app and navigate to the 'Crop Health' section." />
            </ListItem>
            <ListItem>
              <ListItemIcon>
                <CheckCircleOutlineIcon />
              </ListItemIcon>
              <ListItemText primary="Follow the on-screen instructions to capture a photo of your crop." />
            </ListItem>
            <ListItem>
              <ListItemIcon>
                <CheckCircleOutlineIcon />
              </ListItemIcon>
              <ListItemText primary="View the instant analysis and recommendations provided by the app." />
            </ListItem>
          </List>
        </Paper>

        {/* For Technologists Section
        <Paper elevation={3} sx={{ my: 2, p: 2 }}>
          <Typography variant="h4" gutterBottom>
            For Technologists
          </Typography>
          <Typography paragraph>
            If you're interested in the technical details or contributing to the project, here's how you can get involved:
          </Typography>
          <List>
            <ListItem>
              <ListItemIcon>
                <CheckCircleOutlineIcon />
              </ListItemIcon>
              <ListItemText primary="Explore the project repository on GitHub to understand the architecture and technologies used." />
            </ListItem>
            <ListItem>
              <ListItemIcon>
                <CheckCircleOutlineIcon />
              </ListItemIcon>
              <ListItemText primary="Read the documentation for details on setting up your development environment and contributing guidelines." />
            </ListItem>
            <ListItem>
              <ListItemIcon>
                <CheckCircleOutlineIcon />
              </ListItemIcon>
              <ListItemText primary="Join our community forum or Slack channel to discuss features, bugs, and enhancements." />
            </ListItem>
          </List>
        </Paper> */}
      </Box>
    </Container>
  );
};

export default HowToUse;

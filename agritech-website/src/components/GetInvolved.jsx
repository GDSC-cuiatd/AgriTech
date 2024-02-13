import React from 'react';
import { Box, Typography, Container, Paper, Button } from '@mui/material';

const GetInvolved = () => {
  return (
    <Container id='get-involved' maxWidth="lg">
      <Box py={6}>
        <Typography variant="h3" gutterBottom align="center">
          Get Involved
        </Typography>

        {/* For Volunteers */}
        {/* <Paper elevation={3} sx={{ p: 2, mb: 4 }}>
          <Typography variant="h4" gutterBottom>
            For Volunteers
          </Typography>
          <Typography paragraph>
            We're always looking for passionate individuals to join our cause. Whether you're an expert in AI, a web developer, or just passionate about agriculture, there's a place for you in our project.
          </Typography>
          <Button variant="contained" sx={{ mt: 2 }}>
            Volunteer with Us
          </Button>
        </Paper> */}

        {/* For Investors */}
        <Paper elevation={3} sx={{ p: 2 }}>
          <Typography variant="h4" gutterBottom>
            For Investors
          </Typography>
          <Typography paragraph>
            AgriTech is open to partnerships and investments to further our mission. If you're interested in supporting sustainable agriculture through technology, we'd love to hear from you.
          </Typography>
          <Button variant="contained" color="primary" sx={{ mt: 2 }}>
            Partner with Us
          </Button>
        </Paper>
      </Box>
    </Container>
  );
};

export default GetInvolved;

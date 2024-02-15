import React from 'react';
import { Box, Typography, Container, Button, Grid, Link } from '@mui/material';

const ContactUs = () => {
  return (
    <Container maxWidth="lg">
      <Box py={6} textAlign="center">
        <Typography variant="h3" gutterBottom>
          Contact Us
        </Typography>

        {/* Contact Information */}
        <Typography variant="h5" sx={{ mt: 2 }}>
          Email us at: 
          <Link href="mailto:dsc.cuiatd@gmail.com" sx={{ ml: 1 }}>dsc.cuiatd@gmail.com</Link> {/* Replace with actual GDSC email */}
        </Typography>

        {/* GDSC Community Links */}
        <Box sx={{ mt: 4 }}>
          <Typography variant="h5" gutterBottom>
            Join our GDSC Community
          </Typography>
          <Grid container spacing={2} justifyContent="center">
            <Grid item>
              <Button variant="contained" component="a" href="https://gdsc.community.dev/comsats-university-islamabad-abbottabad-campus/" target="_blank" sx={{ mt: 3 }}>
                GDSC Platform
              </Button>
            </Grid>
            <Grid item>
              <Button variant="contained" component="a" href="https://www.linkedin.com/company/dsc-cuiatd/mycompany/" target="_blank" sx={{ mt: 3 }}>
                LinkedIn
              </Button>
            </Grid>
            {/* Add more buttons for other GDSC community links as needed */}
          </Grid>
        </Box>
      </Box>
    </Container>
  );
};

export default ContactUs;

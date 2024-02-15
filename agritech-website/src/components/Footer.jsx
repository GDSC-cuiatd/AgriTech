import React from 'react';
import { Box, Container, Typography, Grid, CardMedia } from '@mui/material';
import gdsc from '../assets/Images/gdsc.jpeg'
const Footer = () => {
  return (
    <Box component="footer" sx={{ backgroundColor: 'white', color: 'black', py: 3 }}>
      <Container maxWidth="lg">
        <Grid container spacing={3} justifyContent="space-between" alignItems="center">
          <Grid item xs={12} sm={6}>
            <Typography variant="body1">
              © 2024 All Rights reserved by GDSC CUI, Abbottabad
            </Typography>
          </Grid>
          <Grid item xs={12} sm={6} sx={{ display: 'flex', justifyContent: 'flex-end' }}>
            <CardMedia
              component="img"
              sx={{ width: 'auto', maxHeight: 100 }} // Adjust the size as needed
              image={gdsc} // Replace with the path to the GDSC Abbottabad image
              alt="GDSC Abbottabad"
            />
          </Grid>
        </Grid>
      </Container>
    </Box>
  );
};

export default Footer;

import React,{useState,useEffect} from 'react';
import { CssBaseline, Typography, Button, Box } from '@mui/material';
import { ThemeProvider, createTheme } from '@mui/material/styles';
import Image1 from '../assets/Images/image-1.jpg'
import { Link, Events } from 'react-scroll';

// Google's color palette
const theme = createTheme({
  palette: {
    primary: { main: '#1a73e8' }, // Google Blue
    secondary: { main: '#ea4335' }, // Google Red
  },
});


const HomePage = () => {
// State to manage the hash
const [activeHash, setActiveHash] = useState(window.location.hash);

useEffect(() => {
  // Scroll event listeners
  Events.scrollEvent.register('begin', function () {
    console.log('begin', arguments);
  });

  Events.scrollEvent.register('end', function () {
    console.log('end', arguments);
  });

  // This function is called on click before scrolling begins
  const handleSetActive = (to) => {
    // Delay updating the URL hash
    setTimeout(() => {
      setActiveHash(to);
    }, 800); // Adjust the time for your specific delay
  };

  // Clean up
  return () => {
    Events.scrollEvent.remove('begin');
    Events.scrollEvent.remove('end');
  };
}, []);
  // This function is called on click before scrolling begins
  const handleSetActive = (to) => {
    // Delay updating the URL hash
    setTimeout(() => {
      setActiveHash(to);
    }, 800); // Adjust the time for your specific delay
  };

// Sync the hash in the URL when activeHash changes
useEffect(() => {
  if (activeHash) {
    window.location.hash = activeHash;
  }
}, [activeHash]);

  return (
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <Box
        sx={{
          display: 'flex',
          flexDirection: 'column',
          justifyContent: 'center',
          alignItems: 'center',
          height: '100vh',
          backgroundImage: `url(${Image1})`,
          backgroundSize: 'cover',
          backgroundPosition: 'center',
        }}
      >
        <Box textAlign="center" bgcolor="rgba(255, 255, 255, 0.8)" p={4} borderRadius={2}>
          <Typography variant="h2" component="h1" gutterBottom>
            Welcome to AgriTech
          </Typography>
          <Typography variant="h5" gutterBottom>
            Revolutionizing Agriculture with AI
          </Typography>
          <Typography paragraph>
            AgriTech is dedicated to combating crop diseases and reducing related losses through cutting-edge AI technology. Our innovative solutions are tailored to enhance agricultural productivity and sustainability.
          </Typography>
          <Box mt={4}>
          <Button
      variant="contained"
      sx={{
        mr: 2,
        backgroundColor: '#4caf50', // Example custom color
        '&:hover': {
          backgroundColor: '#388e3c', // Darken the color slightly on hover
        },
        color:'white'
      }}
    >
      <Link
        to="learn-more" // The ID of the element to scroll to
        spy={true}
        smooth={true}
        duration={500} // Duration of the scroll animation
        onSetActive={handleSetActive}
        style={{ textDecoration: 'none', color: 'inherit' }} // Inherit the color from the Button component

         // Function called before scrolling
      >
        Learn More
      </Link>
    </Button>
    <Button
      variant="contained"
      sx={{
        mr: 2,
        backgroundColor: '#FF0000', // Example custom color
        '&:hover': {
          backgroundColor: '#AF2222', // Darken the color slightly on hover
        },

        color:'white'
      }}
    >
      <Link
        to="get-involved" // The ID of the element to scroll to
        spy={true}
        smooth={true}
        duration={1000} // Duration of the scroll animation
        onSetActive={handleSetActive}
        style={{ textDecoration: 'none', color: 'inherit' }} // Inherit the color from the Button component

         // Function called before scrolling
      >
       Get Involved
      </Link>
    </Button>
            
          </Box>
        </Box>
      </Box>
    </ThemeProvider>
  );
};

export default HomePage;

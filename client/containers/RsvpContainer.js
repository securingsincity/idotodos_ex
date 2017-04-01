import { connect } from 'react-redux'
import RSVP from '../components/rsvp.js'
import {
  initialLoad,
  sendRSVP,
  setAttending,
  onFirstNameChange,
  onLastNameChange,
  addGuest,
  requestSong,
  setMealChoice,
  setAllergies,
  setShuttle} from '../actions/rsvp.js'
const mapStateToProps = (state, ownProps) => {
  return {
    guests: state.rsvp.get("guests"),
    maxGuests: state.rsvp.get("maxGuests"),
    songChoices: state.rsvp.get("songChoices"),
    mealChoices: state.rsvp.get("mealChoices"),
    mealChoice: state.rsvp.get("mealChoice"),
    allergies: state.rsvp.get("allergies"),
    songs: state.rsvp.get("songs"),
    hasErrors: state.errors.get("hasErrors"),
    guestErrors: state.errors.get("guests"),
    shuttle: state.rsvp.get("shuttle")
  }
}
const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    initialData: () => {
      dispatch(initialLoad(window.data.guests, window.data.maxGuests))
    },
    onFirstNameChange: (id, name) => {
      dispatch(onFirstNameChange(id, name))
    },
    onLastNameChange: (id, name) => {
      dispatch(onLastNameChange(id, name))
    },
    addGuest: () => {
      dispatch(addGuest())
    },
    sendRSVP: () => {
      dispatch(sendRSVP());
    },
    setShuttle: (shuttle) => {
      dispatch(setShuttle(shuttle))
    },
    setAttending: (id, isAttending) => {
      dispatch(setAttending(id, isAttending))
    },
    setAllergies: (id, allergies) => {
      dispatch(setAllergies(id, allergies))
    },
    setMealChoice: (id, mealChoice) => {
      dispatch(setMealChoice(id, mealChoice))
    },
    requestSong: (songName) => {
      dispatch(requestSong(songName))
    }
  }
}
export default connect(
  mapStateToProps,
  mapDispatchToProps
)(RSVP)

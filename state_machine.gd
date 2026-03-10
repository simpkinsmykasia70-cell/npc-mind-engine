# Finite State Machine Base Class

class FiniteStateMachine:
    def __init__(self):
        self.state = None
        self.states = {}

    def add_state(self, state_name, state):
        self.states[state_name] = state

    def set_state(self, state_name):
        if state_name in self.states:
            self.state = self.states[state_name]
        else:
            raise ValueError(f"State '{state_name}' does not exist!")

    def update(self):
        if self.state:
            self.state.update()

    def is_in_state(self, state_name):
        return self.state == self.states.get(state_name, None)
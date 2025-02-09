"
Use SpColorPickerWindowPresenter instead
"
Class {
	#name : 'SpColorPickerWindow',
	#superclass : 'SpColorPickerWindowPresenter',
	#category : 'ColorPicker',
	#package : 'ColorPicker'
}


{ #category : 'testing' }
SpColorPickerWindow class >> isDeprecated [
		" Uses SpColorPickerWindowPresenter instead of SpColorPickerWindow"
		^ true
]

{ #category : 'instance creation' }
SpColorPickerWindow class >> defaultPreferredExtent [
	^ (350 @ 550)
]

{ #category : 'instance creation' }
SpColorPickerWindow class >> defaultPreferredExtent [
	^ (350 @ 550)
]

{ #category : 'testing' }
SpColorPickerWindow class >> isDeprecated [
		" Uses SpColorPickerWindowPresenter instead of SpColorPickerWindow"
		^ true
]

{ #category : 'instance creation' }
SpColorPickerWindow class >> open [
	<script>

	^ self new open
]

{ #category : 'layout' }
SpColorPickerWindow >> defaultLayout [ 

	^ SpBoxLayout newTopToBottom 
		add: colorPickerPresenter;
		add: toolbar expand: false;
		yourself
]

{ #category : 'initialization' }
SpColorPickerWindow >> initializePresenters [

	colorPickerPresenter := self newColorPicker.
	toolbar := self newToolbar.
	self toolbarButtons do: [ :button | toolbar addItem: button ]
]

{ #category : 'initialization' }
SpColorPickerWindow >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter 
		whenClosedDo: [ self owner color: colorPickerPresenter color ]
]

{ #category : 'initialization' }
SpColorPickerWindow >> title [

	^ 'Color Picker'
]

{ #category : 'initialization' }
SpColorPickerWindow >> toolbarButtons [
	| buttons |

	buttons := OrderedCollection new.
	buttons 
			add: (self newToolbarButton
					 label: 'Cancel';
					 icon: (self iconNamed: #smallCancel);
					 help: 'Cancel the color selection';
					 action: [ self delete ];
					 yourself);
			add: (self newToolbarButton
			 label: 'Select';
			 icon: (self iconNamed: #smallOk);
			 help: 'Select and close';
			 action: [ self delete ];
			 yourself).

	^ buttons
]

{ #category : 'initialization' }
SpColorPickerWindow >> windowIcon [

	^ self iconNamed: #smallPaint
]

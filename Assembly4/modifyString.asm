.386
.MODEL FLAT
.CODE
MODIFY_STRING MACRO
	LOCAL LOOP_END_OF_STRING, NO_SPACE
	LOOP_END_OF_STRING:
		MOV EDX, [EAX]
		CMP DL, 32
		JE NO_SPACE
			MOV [ESI], DL
			INC ESI
		NO_SPACE:
		INC EAX
		CMP EAX, EBX
	JNE LOOP_END_OF_STRING
	MOV DL, 10
	MOV [ESI], DL
	INC ESI
ENDM
_MODIFY_DATA PROC
	PUSH EBP
	MOV EBP, ESP
	MOV ECX, [EBP]+8
	MOV ESI, [EBP]+12
	DEC ECX
	FOUND_END_OF_STRING:
		MOV EAX, ECX
		INC EAX
	LOOP_STRINGS:
		INC ECX		
		MOV EDX, [ECX]
		CMP DL, 204
		JE LOOP_LAST_STRING
		CMP DL, 10
	JNE LOOP_STRINGS
	MOV EBX, ECX
	MODIFY_STRING
	JMP FOUND_END_OF_STRING
	LOOP_LAST_STRING:
	MOV EBX, ECX
	MODIFY_STRING
	POP EBP
	MOV DL, 0
	MOV [ESI], DL
	RET
_MODIFY_DATA ENDP
END
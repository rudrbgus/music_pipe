package com.meatjellyburgur.musicpipe.dto.response;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TeamRegisterResponseDTO {
   private String teamName;
   private  int instrumentId;
   private  String role;
   private int teamId;
}

import '../models/mystery.dart';

const Mystery mainMystery = Mystery(
  id: 'mystery_001',
  title: 'The Missing Necklace',
  description:
  'A valuable diamond necklace disappeared during a dinner party. Four guests were inside the house when it happened.',
  location: 'Blackwood Mansion',
  victim: 'Lady Eleanor',
  correctSuspect: 'Emma',
  solution:
  'Emma was responsible. The broken window was staged to make it look like an outsider entered the house. The missing key and Emma’s contradictory statement reveal the truth.',
  suspects: [
    Suspect(
      name: 'Sarah',
      emoji: '👩',
      description: 'A close friend of the victim.',
      statement:
      'I was in the kitchen preparing dessert. I never went upstairs.',
    ),
    Suspect(
      name: 'Daniel',
      emoji: '👨',
      description: 'The victim’s business partner.',
      statement:
      'I was in the office checking some documents when everyone heard the noise.',
    ),
    Suspect(
      name: 'Michael',
      emoji: '🧔',
      description: 'The victim’s cousin.',
      statement:
      'I spent most of the evening in the garden. I came inside after hearing the glass break.',
    ),
    Suspect(
      name: 'Emma',
      emoji: '👩‍🦰',
      description: 'A guest who arrived late.',
      statement:
      'I arrived after dinner and stayed in the living room the entire time.',
    ),
  ],
  evidence: [
    Evidence(
      title: 'Broken Window',
      description:
      'A window was broken from inside the mansion. There are no footprints outside it.',
      emoji: '🪟',
    ),
    Evidence(
      title: 'Missing Key',
      description:
      'A spare key to the upstairs room disappeared from the hallway drawer.',
      emoji: '🔑',
    ),
    Evidence(
      title: 'Footprint',
      description:
      'A muddy footprint was found near the upstairs room.',
      emoji: '👣',
    ),
    Evidence(
      title: 'Security Camera',
      description:
      'The camera shows someone entering the hallway shortly before the alarm.',
      emoji: '📹',
    ),
  ],
);
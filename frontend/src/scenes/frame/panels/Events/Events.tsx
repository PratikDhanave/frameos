import { Box } from '../../../../components/Box'
import { H6 } from '../../../../components/H6'

export function Events() {
  const onDragStart = (event: any, type: 'event', keyword: string) => {
    event.dataTransfer.setData('application/reactflow', JSON.stringify({ type, keyword }))
    event.dataTransfer.effectAllowed = 'move'
  }
  return (
    <div className="space-y-2">
      <div>Drag the boxes below onto the diagram</div>

      <Box
        className="bg-gray-900 px-3 py-2 dndnode"
        draggable
        onDragStart={(event) => onDragStart(event, 'event', 'render')}
      >
        <H6>Event: Render</H6>
        <div className="text-sm">When a scene render is requested</div>
      </Box>

      <Box
        className="bg-gray-900 px-3 py-2 dndnode"
        draggable
        onDragStart={(event) => onDragStart(event, 'event', 'button_press')}
      >
        <H6>Event: Button Press</H6>
        <div className="text-sm">When a button or screen is pressed</div>
      </Box>
    </div>
  )
}

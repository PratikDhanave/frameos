import { A } from 'kea-router'
import { FrameType } from '../../types'
import { H5 } from '../../components/H5'
import { Box } from '../../components/Box'
import { frameHost, frameStatus } from '../../decorators/frame'
import { Image } from './Image'
import { DropdownMenu } from '../../components/DropdownMenu'
import { ArrowPathIcon, ClipboardIcon, TrashIcon } from '@heroicons/react/24/solid'
import copy from 'copy-to-clipboard'
import React from 'react'
import { useActions } from 'kea'
import { framesModel } from '../../models/framesModel'

interface FrameProps {
  frame: FrameType
}

export function Frame({ frame }: FrameProps): JSX.Element {
  const { deleteFrame } = useActions(framesModel)
  return (
    <Box id={`frame-${frame.id}`} className="relative">
      <div className="flex gap-2 absolute z-10 right-2 top-2">
        <DropdownMenu
          buttonColor="none"
          items={[
            {
              label: 'Delete',
              onClick: () =>
                window.confirm(`Are you sure you want to delete the frame "${frame.name}"?`) && deleteFrame(frame.id),
              icon: <TrashIcon className="w-5 h-5" />,
            },
          ]}
        />
      </div>
      <A href={`/frames/${frame.id}`}>
        <Image id={frame.id} />
      </A>
      <div className="flex justify-between px-4 pt-2 mb-2">
        <H5 className="text-ellipsis overflow-hidden">
          <A href={`/frames/${frame.id}`}>{frame.name || frameHost(frame)}</A>
        </H5>
      </div>
      <div className="px-4 pb-4">
        <div className="flex sm:text-lg text-gray-400 items-center">{frameStatus(frame)}</div>
      </div>
    </Box>
  )
}

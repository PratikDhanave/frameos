import { afterMount, kea, path } from 'kea'

import type { appsModelType } from './appsModelType'
import { loaders } from 'kea-loaders'
import { AppConfig } from '../types'

export const appsModel = kea<appsModelType>([
  path(['src', 'models', 'appsModel']),
  loaders(({ values }) => ({
    apps: [
      {} as Record<string, AppConfig>,
      {
        loadApps: async () => {
          try {
            const response = await fetch('/api/apps')
            if (!response.ok) {
              throw new Error('Failed to fetch frames')
            }
            const data = await response.json()
            return data.apps as Record<string, AppConfig>
          } catch (error) {
            console.error(error)
            return values.apps
          }
        },
      },
    ],
  })),
  afterMount(({ actions }) => {
    actions.loadApps()
  }),
])

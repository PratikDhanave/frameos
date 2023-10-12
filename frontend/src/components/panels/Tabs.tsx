import clsx from 'clsx'

interface TabsProps {
  children: React.ReactNode
  className?: string
}

export function Tabs({ children, className }: TabsProps): JSX.Element {
  return (
    <div
      className={clsx(
        'flex items-start flex-nowrap text-sm font-medium text-center text-gray-500 dark:border-gray-700 dark:text-gray-400 space-x-2 w-auto overflow-y-auto',
        className
      )}
    >
      {children}
    </div>
  )
}

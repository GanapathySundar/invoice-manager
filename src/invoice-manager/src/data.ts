import {ipcMain, dialog} from 'electron';
import sqlite from 'sqlite-electron';

ipcMain.handleOnce('databasePath', async (event, dbPath: string) => {
    try {
        await sqlite.setdbPath(dbPath);
    } catch (e) {
        console.error(e);
        dialog.showErrorBox('Invoice Manager', 'Could not establish a connection to the database');
    }
});

ipcMain.handle('executeQueries', async (event) => {

});
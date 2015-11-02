Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:56680 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754069AbbKBQoH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Nov 2015 11:44:07 -0500
Subject: Re: linux-next: Tree for Nov 1 (xconfig problem)
References: <20151102035340.17310681@canb.auug.org.au>
 <5636D465.4060104@infradead.org> <56376784.3030804@suse.cz>
 <2030804.WKiRYyHexJ@tjmaciei-mobl4>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <563792D1.2040301@infradead.org>
Date: Mon, 2 Nov 2015 08:44:01 -0800
MIME-Version: 1.0
In-Reply-To: <2030804.WKiRYyHexJ@tjmaciei-mobl4>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thiago Macieira <thiago.macieira@intel.com>, Michal Marek <mmarek@suse.cz>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild <linux-kbuild@vger.kernel.org>, Boris Barbulovski <bbarbulovski@gmail.com>

On 11/02/15 05:51, Thiago Macieira wrote:
> On Monday 02 November 2015 14:39:16 Michal Marek wrote:
>> On 2015-11-02 04:11, Randy Dunlap wrote:
>>> On 11/01/15 08:53, Stephen Rothwell wrote:
>>>> Hi all,
>>>>
>>>> I start again a day early, and this is how you all repay me? ;-)
>>>
>>>> Changes since 20151022:
>>> on x86_64:
>>>
>>> 'make xconfig' dies a quick death when I try to use it:
>>>
>>> linux-next-20151101> ASSERT: "!isEmpty()" in file
>>> /usr/include/QtCore/qlist.h, line 282
>> Added Boris and Thiago to Cc.
>>
>> Are you using Qt4 or Qt5? An
> 
> Given the line number, it's a Qt 4.
> 
> Randy, we need a backtrace. The problem is on the function that called 
> first(). Can you make sure the crash generates a core dump, then get the bt 
> from that?
> 

ASSERT: "!isEmpty()" in file /usr/include/QtCore/qlist.h, line 282
../scripts/kconfig/Makefile:22: recipe for target 'xconfig' failed
make[2]: *** [xconfig] Aborted (core dumped)


(gdb) bt
#0  0x00007f858b7e5187 in raise () at /lib64/libc.so.6
#1  0x00007f858b7e6538 in abort () at /lib64/libc.so.6
#2  0x00007f858c3ee2b4 in qt_message_output(QtMsgType, char const*) ()
    at /usr/lib64/libQtCore.so.4
#3  0x00007f858c3ee439 in  () at /usr/lib64/libQtCore.so.4
#4  0x00007f858c3eec44 in qFatal(char const*, ...) ()
    at /usr/lib64/libQtCore.so.4
#5  0x00007f858c3eec8a in  () at /usr/lib64/libQtCore.so.4
#6  0x00000000004206cc in ConfigList::updateSelection() ()
#7  0x0000000000420758 in ConfigList::qt_static_metacall(QObject*, QMetaObject::Call, int, void**) [clone .part.51] ()
#8  0x00007f858c50e1fa in QMetaObject::activate(QObject*, QMetaObject const*, int, void**) () at /usr/lib64/libQtCore.so.4
#9  0x00007f858cfa7818 in  () at /usr/lib64/libQtGui.so.4
#10 0x00007f858c50e1fa in QMetaObject::activate(QObject*, QMetaObject const*, int, void**) () at /usr/lib64/libQtCore.so.4
#11 0x00007f858cf83087 in QItemSelectionModel::selectionChanged(QItemSelection const&, QItemSelection const&) () at /usr/lib64/libQtGui.so.4
#12 0x00007f858cf886c1 in QItemSelectionModel::emitSelectionChanged(QItemSelection const&, QItemSelection const&) () at /usr/lib64/libQtGui.so.4
#13 0x00007f858cf88e93 in QItemSelectionModel::select(QItemSelection const&, QFlags<QItemSelectionModel::SelectionFlag>) () at /usr/lib64/libQtGui.so.4
#14 0x00007f858cf833f6 in QItemSelectionModel::clearSelection() ()
---Type <return> to continue, or q <return> to quit---
    at /usr/lib64/libQtGui.so.4
#15 0x00007f858c50e1fa in QMetaObject::activate(QObject*, QMetaObject const*, int, void**) () at /usr/lib64/libQtCore.so.4
#16 0x0000000000426057 in ConfigList::focusInEvent(QFocusEvent*) ()
#17 0x00007f858ca8e8c9 in QWidget::event(QEvent*) ()
    at /usr/lib64/libQtGui.so.4
#18 0x00007f858ce2b5ee in QFrame::event(QEvent*) () at /usr/lib64/libQtGui.so.4
#19 0x00007f858cea7b7b in QAbstractScrollArea::event(QEvent*) ()
    at /usr/lib64/libQtGui.so.4
#20 0x00007f858cf3aadb in QAbstractItemView::event(QEvent*) ()
    at /usr/lib64/libQtGui.so.4
#21 0x00007f858ca3f76c in QApplicationPrivate::notify_helper(QObject*, QEvent*) () at /usr/lib64/libQtGui.so.4
#22 0x00007f858ca45cad in QApplication::notify(QObject*, QEvent*) ()
    at /usr/lib64/libQtGui.so.4
#23 0x00007f858c4fa2ad in QCoreApplication::notifyInternal(QObject*, QEvent*) () at /usr/lib64/libQtCore.so.4
#24 0x00007f858ca43eea in QApplicationPrivate::setFocusWidget(QWidget*, Qt::FocusReason) () at /usr/lib64/libQtGui.so.4
#25 0x00007f858ca89d7b in QWidget::setFocus(Qt::FocusReason) ()
    at /usr/lib64/libQtGui.so.4
#26 0x00007f858ca46cc0 in QApplication::notify(QObject*, QEvent*) ()
    at /usr/lib64/libQtGui.so.4
---Type <return> to continue, or q <return> to quit---
#27 0x00007f858c4fa2ad in QCoreApplication::notifyInternal(QObject*, QEvent*) () at /usr/lib64/libQtCore.so.4
#28 0x00007f858cab34bf in  () at /usr/lib64/libQtGui.so.4
#29 0x00007f858cab717c in  () at /usr/lib64/libQtGui.so.4
#30 0x00007f858cab570c in QApplication::x11ProcessEvent(_XEvent*) ()
    at /usr/lib64/libQtGui.so.4
#31 0x00007f858cadc5c2 in  () at /usr/lib64/libQtGui.so.4
#32 0x00007f858b2d0a04 in g_main_context_dispatch ()
    at /usr/lib64/libglib-2.0.so.0
#33 0x00007f858b2d0c48 in  () at /usr/lib64/libglib-2.0.so.0
#34 0x00007f858b2d0cec in g_main_context_iteration ()
    at /usr/lib64/libglib-2.0.so.0
#35 0x00007f858c5270be in QEventDispatcherGlib::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () at /usr/lib64/libQtCore.so.4
#36 0x00007f858cadc676 in  () at /usr/lib64/libQtGui.so.4
#37 0x00007f858c4f8e6f in QEventLoop::processEvents(QFlags<QEventLoop::ProcessEventsFlag>) () at /usr/lib64/libQtCore.so.4
#38 0x00007f858c4f9165 in QEventLoop::exec(QFlags<QEventLoop::ProcessEventsFlag>) () at /usr/lib64/libQtCore.so.4
#39 0x00007f858c4fe5b9 in QCoreApplication::exec() ()
    at /usr/lib64/libQtCore.so.4
#40 0x000000000040d1dd in main ()


-- 
~Randy

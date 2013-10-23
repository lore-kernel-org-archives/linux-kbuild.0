Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:58073 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752409Ab3JWKvp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Oct 2013 06:51:45 -0400
Message-ID: <5267AA3E.1040003@linutronix.de>
Date: Wed, 23 Oct 2013 12:51:42 +0200
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
Subject: choice =y selection becomes lost after having multiple entries =m
 with depends on
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, Felipe Balbi <balbi@ti.com>, USB list <linux-usb@vger.kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Roger Quadros <rogerq@ti.com>

Hi,

in USB gadget menu (that is Device Drivers ---> USB support ---> USB
Gadget Support --->  USB Gadget Drivers) I can create a configuration
which is "lost". Here is how to reproduce it:

- first config two gadgets as M:
 <M>   USB Gadget Drivers
 <M>     Audio Gadget
 <M>     Ethernet Gadget
 <M>     MIDI Gadget

 save config & leave

- now start menu config again and go to the same menu, now select
  built-in:
  <*>   USB Gadget Drivers (Ethernet Gadget
  the ethernet gadget is chosen automatically because we can have only
  one gadget selected.
  save config & leave

- step three, go back to the menu and you will see that everything is
  as it was (the <*> is ignored).

With only Audio & Ethernet =m and Midi =n then the switch to =y
behaves differently: The menu looks correct (=y) but the .config keeps
the Audio gadget as =M and it is built. Having multiple entries =m
which have no "depends on" behaves correctly.

So the problem exists only if the item itself has a "depends on" line.
Anyone aware of such kconfig limitation?

Sebastian

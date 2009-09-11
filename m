Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lon1-post-2.mail.demon.net ([195.173.77.149]:43068 "EHLO
	lon1-post-2.mail.demon.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754006AbZIKO5F (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Sep 2009 10:57:05 -0400
Subject: special HID & Kconfig: odd behavior in gconfig
From: Richard Kennedy <richard@rsk.demon.co.uk>
Content-Type: text/plain
Date: Fri, 11 Sep 2009 15:57:07 +0100
Message-Id: <1252681027.2282.23.camel@castor>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Kosina <jkosina@suse.cz>
Cc: lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-input@vger.kernel.org

I use gconfig & and cannot turn off any of the special HID devices.

the Kconfig for them all have the same pattern e.g.

config HID_DRAGONRISE
	tristate "DragonRise Inc. support" if EMBEDDED
	depends on USB_HID
	default !EMBEDDED

The 'if EMBEDDED' on the tristate line seems to confuse gconfig and it
sets them all to m & does not let me set them to N. I'm building this on
a standard desktop machine.

Any idea what the intention of this was? or can we just remove the if
embedded part?

thanks

Richard



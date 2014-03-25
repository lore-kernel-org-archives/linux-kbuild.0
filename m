Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:58949 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755840AbaCYRxI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Mar 2014 13:53:08 -0400
Date: Tue, 25 Mar 2014 18:53:04 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC PATCH 0/2] kconfig: Prepare for Qt based kconfig update to
 Qt4/Qt5
Message-ID: <20140325175304.GA3497@ravnborg.org>
References: <kconfig-port-qt>
 <1395760801-27009-1-git-send-email-david.graeff@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395760801-27009-1-git-send-email-david.graeff@web.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Graeff <david.graeff@web.de>
Cc: linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On Tue, Mar 25, 2014 at 04:19:59PM +0100, David Graeff wrote:
> Hi Yann, all,
> 
> with this rfc patch set I would like to reorganize the kconfig directory structure
> in preparation for updating the Qt3 based flavour of kconfig to Qt4/5 and the
> gtk flavour (version 2->3) eventually. I renamed lxdialog to menuconfig and created
> subdirectories for each flavour except the line based one.
> 
> My suggestion is to add a "qconfig" target to the buildsystem for
> beeing consistent with the names of the other targets where the first character provide a hint
> for the used toolkit. And to accommodate the fact that this frontend may also be used on non
> xserver machines. May feel weird to type xconfig on wayland systems. Patch 2 adds that
> target.
> 
> Last time (some month ago) I provided a patch-set containing all changes (buildystem+qt+gtk) at once,
> that didn't worked well.
The patches has not shown up yet. Maybe they are too big?
Remember to use flags to git so we only see the rename and not the full fil in the diff.
-M -P IIRC but I am not sure.

	Sam

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:33110 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754192Ab0HHPmf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 8 Aug 2010 11:42:35 -0400
Date: Sun, 8 Aug 2010 17:42:33 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: nconfig - F2, F3 misbehaves..
Message-ID: <20100808154233.GB4205@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: nir.tzachar@gmail.com, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

Hi Nir.

When I press F2 at one of the top-level menus
then nconfig exits and a '~' is written to stdout.

Same happens when I press F3.

If I press F2 or F3 at a submenu then I see only the README,
and when I get back I am one level up in the menus.

I have not tried to debug this.
It happens with and without the search patch.


	Sam

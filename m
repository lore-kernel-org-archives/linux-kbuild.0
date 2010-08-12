Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:48248 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753336Ab0HLUo0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Aug 2010 16:44:26 -0400
Date: Thu, 12 Aug 2010 22:44:25 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Upcoming cleanup patches
Message-ID: <20100812204425.GA32630@merkur.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>

I am planning to submit to larger cleanup patches soonish.
One of them rely on two patches, and I have asked Michal
to get them upstream soonish.

The first patch is actually a pseudo patch.
It is a small script that convert the remaining *defconfig
files so they follow the minimal format.
I plan to ask Linus to run the script.
diffstat looks impressive...

Linus - if you prefer a pull request I can do so.

The second patch eliminates use of unifdef-y in
all the Kbuild files in include/*

unifdef-y and header-y has the same functionality,
and there is no reason to keep the former.
But the Kbuild files has historically seen
quite some chrunch so I am waiting a few
more days before touching them.

	Sam

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.175]:62662 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754019AbYLUVB2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 21 Dec 2008 16:01:28 -0500
Message-ID: <8bd0f97a0812211301p85df8eev30df76e2006c9704@mail.gmail.com>
Date: Sun, 21 Dec 2008 16:01:26 -0500
From: "Mike Frysinger" <vapier.adi@gmail.com>
Subject: Re: [PATCH 04/26] kbuild: introduce $(kecho) convenience echo
In-Reply-To: <1229783497-19550-4-git-send-email-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20081220142518.GA19390@uranus.ravnborg.org>
	 <1229783497-19550-4-git-send-email-sam@ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Mike Frysinger <vapier@gentoo.org>

On Sat, Dec 20, 2008 at 09:31, Sam Ravnborg wrote:
> So declare a new KECHO variable that only does 'echo' when we
> are in a suitable verbose build mode

maybe you want to change the caps on KECHO in the changelog since it
is no longer KECHO but kecho ?
-mike

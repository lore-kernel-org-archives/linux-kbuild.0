Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:58007 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757022AbZGQVH5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Jul 2009 17:07:57 -0400
Date: Fri, 17 Jul 2009 23:07:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] Kconfig: variable argument lists needs `stdarg.h'
Message-ID: <20090717210756.GC7080@merkur.ravnborg.org>
References: <1a69a9d80907052107w5a2b39b5m2eb4cba3d24318c3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1a69a9d80907052107w5a2b39b5m2eb4cba3d24318c3@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Mon, Jul 06, 2009 at 12:07:14AM -0400, Arnaud Lacombe wrote:
> Fix build on non GNU based platforms.

Applied this and your next patch to kbuild-fixes.git - thanks.

I you contribute additional patches please sign them off according to
SubmittingPatches in Documentation/

I applied both as they are very simple - but usual I would
reject not-signed-off patches.

	Sam

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yx0-f174.google.com ([209.85.213.174]:36817 "EHLO
	mail-yx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752686Ab0KZQlo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Nov 2010 11:41:44 -0500
MIME-Version: 1.0
In-Reply-To: <20101126161511.GD9418@sepie.suse.cz>
References: <4CD300AC.3010708@redhat.com>
	<1289079027-3037-2-git-send-email-lacombar@gmail.com>
	<AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com>
	<4CEF8C74.8010600@suse.cz>
	<20101126161511.GD9418@sepie.suse.cz>
Date: Fri, 26 Nov 2010 11:41:42 -0500
Message-ID: <AANLkTino6vgW6v5Bq3mzCUY-Ozj_5Y7b4W3XAO544GSr@mail.gmail.com>
Subject: Re: [PATCH 1/5] kconfig: add an option to determine a menu's visibility
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>

Hi,

On Fri, Nov 26, 2010 at 11:15 AM, Michal Marek <mmarek@suse.cz> wrote:
> So the patches look OK to me, I added your patches to
> kbuild-2.6.git#menu-visibility and merged the branch to for-next. The
> new syntax should be documented in
> Documentation/kbuild/kconfig-language.txt, below is a first attempt at
> it. If the patches work fine in linux-next _and_ you give me permission
> to push them to Linus, I'll move them to rc-fixes and send a pull
> request.
you've got it :).

Thanks,
 - Arnaud

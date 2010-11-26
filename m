Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:52558 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754309Ab0KZQlP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Nov 2010 11:41:15 -0500
MIME-Version: 1.0
In-Reply-To: <20101126081736.0ba8a90b.rdunlap@xenotime.net>
References: <4CD300AC.3010708@redhat.com>
	<1289079027-3037-2-git-send-email-lacombar@gmail.com>
	<AANLkTi=WS6cveqzxVmwC2wucaCpEJJLHXx0A8XbAChRb@mail.gmail.com>
	<4CEF8C74.8010600@suse.cz>
	<20101126161511.GD9418@sepie.suse.cz>
	<20101126081736.0ba8a90b.rdunlap@xenotime.net>
Date: Fri, 26 Nov 2010 11:41:14 -0500
Message-ID: <AANLkTinuT47+a-BOEXx77YrLQsuKj1M0sR6OqQSCgy12@mail.gmail.com>
Subject: Re: [PATCH 1/5] kconfig: add an option to determine a menu's visibility
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>

Hi,

On Fri, Nov 26, 2010 at 11:17 AM, Randy Dunlap <rdunlap@xenotime.net> wrote:
> Default value of "visible" is true ??
>
yes, but implicitly... I think I should made this explicit.

 - Arnaud

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:39367 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752891Ab0HQFwM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Aug 2010 01:52:12 -0400
Received: by wwi17 with SMTP id 17so602170wwi.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2010 22:52:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1282023725-20428-1-git-send-email-lacombar@gmail.com>
References: <AANLkTinuJJXAB6b0ap6yn0X9nM7grQmYxoJSdyOPVmVj@mail.gmail.com>
	<1282023725-20428-1-git-send-email-lacombar@gmail.com>
Date: Tue, 17 Aug 2010 01:52:11 -0400
Message-ID: <AANLkTikya8_oj5i=+FLC_AaCQEDnmhJSRtJYzsTkv6_0@mail.gmail.com>
Subject: Re: [PATCH] kbuild: implement the `mainmenu' directive
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Arnaud Lacombe <lacombar@gmail.com>

Hi,

On Tue, Aug 17, 2010 at 1:42 AM, Arnaud Lacombe <lacombar@gmail.com> wrote:
> note: the prompt is voluntarily still a bare `const char *'. It may need
> to be represented in a more detailled way, say a `struct property'.
>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
>
> ---
>  scripts/kconfig/lkc.h   |    2 ++
>  scripts/kconfig/menu.c  |   23 +++++++++++++++++++++++
>  scripts/kconfig/zconf.y |    9 ++++++++-
>  3 files changed, 33 insertions(+), 1 deletions(-)
>
this does not change any *_shipped files on purpose. You may have to
LKC_GENPARSER=1 for the change to be in effect.

 - Arnaud

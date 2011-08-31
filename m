Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:52787 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755169Ab1HaMg3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 31 Aug 2011 08:36:29 -0400
Received: by wyh22 with SMTP id 22so94433wyh.19
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Aug 2011 05:36:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1314776773-9560-1-git-send-email-crquan@gmail.com>
References: <CAH5vBdKxbaKDrA2gAj5CoDYShN+5dnfu6Bmd=4+oV-XmnYQnFA@mail.gmail.com>
 <1314776773-9560-1-git-send-email-crquan@gmail.com>
From: Cheng Renquan <crquan@gmail.com>
Date: Wed, 31 Aug 2011 05:36:08 -0700
Message-ID: <CAH5vBdJMh6g4ydRh5DfsSk59oNxWkPV=JN=70p68FKsRn3h4qw@mail.gmail.com>
Subject: Re: [PATCH 0/6] nconf bug fixes and U/E improvements
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Nir Tzachar <nir.tzachar@gmail.com>, Arnaud Lacombe <lacombar@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@xenotime.net>, c.rq541@comcast.net

On Wed, Aug 31, 2011 at 12:46 AM, Cheng Renquan <crquan@gmail.com> wrote:
>  scripts/kconfig/nconf: add KEY_HOME / KEY_END for dialog_inputbox
> The nconfig even has KEY_UP as KEY_RIGHT and KEY_DOWN as KEY_LEFT,
> that I think more unnatural, better remove KEY_UP/KEY_DOWN in such
> a one line editor, or for future possible text area editor;

Hi Nir, how do you think the original design of UP as RIGHT and DOWN as LEFT?
in other applications, I saw DOWN as RIGHT and UP as LEFT; but generally
I think it's better to not support DOWN and UP;

Why is there need for KEY_UP/KEY_DOWN in a one line editor?

>
>  scripts/kconfig/nconf: trunc too long string display in menu
>
>  scripts/kconfig/nconf.c     |   29 ++++++++++-------
>  scripts/kconfig/nconf.gui.c |   73 ++++++++++++++++++++++++++++++++++++-------
>  scripts/kconfig/nconf.h     |    2 +-
>  3 files changed, 79 insertions(+), 25 deletions(-)

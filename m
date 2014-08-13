Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f181.google.com ([209.85.213.181]:63053 "EHLO
	mail-ig0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751405AbaHMTkP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 Aug 2014 15:40:15 -0400
Received: by mail-ig0-f181.google.com with SMTP id h3so2828180igd.2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Aug 2014 12:40:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140813050549.GA30459@ravnborg.org>
References: <CA+r1Zhg5=9Ff90Ur0Bfgrc3eCr404Ym_amn-0SDpnndYSHV++w@mail.gmail.com>
	<20140813050549.GA30459@ravnborg.org>
Date: Wed, 13 Aug 2014 12:40:14 -0700
Message-ID: <CA+r1ZhhFmkA7s63GozNY6gxYH956cDwC0GrFwh-HzJrwfzMc6w@mail.gmail.com>
Subject: Re: Problem building 3.16 with make O=...
From: Jim Davis <jim.epost@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org

On Tue, Aug 12, 2014 at 10:05 PM, Sam Ravnborg <sam@ravnborg.org> wrote:

> You need to copy the config to the output directory - not the source directory.
> Change this line:
>     cp /boot/config*24-generic .config
> to something like this:
>     cp /boot/config*24-generic /tmp/$$/.config
>
> Should do the trick.
> Make sure the dir exist before you copy.

Thanks!  Worked like a charm.

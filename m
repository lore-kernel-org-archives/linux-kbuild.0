Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from fk-out-0910.google.com ([209.85.128.187]:12398 "EHLO
	fk-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbYIDPFX convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Sep 2008 11:05:23 -0400
Received: by fk-out-0910.google.com with SMTP id 18so2633932fkq.5
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Sep 2008 08:05:21 -0700 (PDT)
From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [PATCH] ncurses based config
Date: Thu, 4 Sep 2008 17:02:30 +0200
References: <1220469076-16487-1-git-send-email-nir@tzachar.com> <Pine.LNX.4.64.0809031259110.20541@shark.he.net> <20080903222927.7d191458@Varda>
In-Reply-To: <20080903222927.7d191458@Varda>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200809041702.30301.bzolnier@gmail.com>
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alejandro Riveira =?utf-8?q?Fern=C3=A1ndez?= <ariveira@gmail.com>
Cc: "Randy.Dunlap" <rdunlap@xenotime.net>, Nir Tzachar <tzachar@grad120a.cs.bgu.ac.il>, linux-kernel@vger.kernel.org, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Nir Tzachar <nir@tzachar.com>

On Wednesday 03 September 2008, Alejandro Riveira Fernández wrote:

[...]

> > I'm seeing cyan (?) foreground on black background.  Is that the colors
> > that were planned?
>   
>  much nicer colors here (ubuntu) 
>  http://img177.imageshack.us/my.php?image=pantallazonm7.png

Update: under Fedora9 with default settings:

- X + xterm: colors are OK

- X + konsole: colors are not OK

- console (on vesafb): colors are OK except that frames are "invisible"

Seems like there are some compatibility issues to be resolved...

Thanks,
Bart

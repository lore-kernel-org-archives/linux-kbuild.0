Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f218.google.com ([209.85.220.218]:50578 "EHLO
	mail-fx0-f218.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757862AbZGQVYt convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Jul 2009 17:24:49 -0400
Received: by fxm18 with SMTP id 18so978808fxm.37
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jul 2009 14:24:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090717210756.GC7080@merkur.ravnborg.org>
References: <1a69a9d80907052107w5a2b39b5m2eb4cba3d24318c3@mail.gmail.com>
	 <20090717210756.GC7080@merkur.ravnborg.org>
Date: Fri, 17 Jul 2009 17:24:48 -0400
Message-ID: <1a69a9d80907171424h1b2ef908i9f3bda24ced84a46@mail.gmail.com>
Subject: Re: [PATCH 1/2] Kconfig: variable argument lists needs `stdarg.h'
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

Hi Sam,

Thanks a lot. Sorry for the missing signed-of-by issue, it was my
first public patch submit through git :-)

 - Arnaud

On Fri, Jul 17, 2009 at 5:07 PM, Sam Ravnborg<sam@ravnborg.org> wrote:
> On Mon, Jul 06, 2009 at 12:07:14AM -0400, Arnaud Lacombe wrote:
>> Fix build on non GNU based platforms.
>
> Applied this and your next patch to kbuild-fixes.git - thanks.
>
> I you contribute additional patches please sign them off according to
> SubmittingPatches in Documentation/
>
> I applied both as they are very simple - but usual I would
> reject not-signed-off patches.
>
>        Sam
>

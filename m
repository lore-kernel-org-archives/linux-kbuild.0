Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:57993 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727611AbeIFDcU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Sep 2018 23:32:20 -0400
Date: Wed, 5 Sep 2018 17:53:33 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v4 07/11] kbuild: use 'include' directive to load auto.conf from top Makefile
Message-ID: <20180905225333.GA23155@gate.crashing.org>
References: <1532072796-7947-1-git-send-email-yamada.masahiro@socionext.com> <1532072796-7947-8-git-send-email-yamada.masahiro@socionext.com> <20180903093945.GA1195@zn.tnic> <CAK7LNAQOd-QA6E7189q4K-p_9ReRtE88UbhtuXS9600nOQTgaA@mail.gmail.com> <20180903100021.GD10249@zn.tnic>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180903100021.GD10249@zn.tnic>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Borislav Petkov <bp@alien8.de>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Dirk Gouders <dirk@gouders.net>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Sep 03, 2018 at 12:00:21PM +0200, Borislav Petkov wrote:
> On Mon, Sep 03, 2018 at 06:54:12PM +0900, Masahiro Yamada wrote:
> > You are right - I missed this usecase,
> > but I still want to excuse "it is rare enough".
> 
> Isn't there a Makefile way to check file existence before including it?

Sure there is, you can use $(wildcard ) .


Segher

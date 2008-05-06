Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.230]:51061 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759252AbYEFPwP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 6 May 2008 11:52:15 -0400
Received: by rv-out-0506.google.com with SMTP id l9so1744217rvb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 May 2008 08:52:14 -0700 (PDT)
Message-ID: <8499950a0805060852m6b9a7b16q8047908cd9e44f52@mail.gmail.com>
Date: Tue, 6 May 2008 16:52:14 +0100
From: "Oleg Verych" <olecom@gmail.com>
Subject: Re: kconfig - a suggestion how to fix the select issue
In-Reply-To: <alpine.LNX.1.10.0805042004310.11757@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080504071041.GA15315@uranus.ravnborg.org>
	 <alpine.LNX.1.10.0805042004310.11757@fbirervta.pbzchgretzou.qr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Engelhardt <jengelh@medozas.de>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

>  Suggestion:
>
>  Make kconfig work like an interactive package manager. All objects are
>  visible and the user can select any of them.

It seems, like package maintainers leave all their job to end user. I don't know
many packages, which are as configurable as software package itself. To solve
few alternatives or versioning -- is kind of easy job: package is
built statically.
Otherwise they just pull all-new stuff anyway.

As of kernel config, there must be a simple and flexible tool to help
constructing
correct CONFIG_* sets as for developers to develop as for users to use.

Current situation is when "real guru edits with `cat >source.c`" is not funny.
____

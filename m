Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns.firmix.at ([62.141.48.66]:5015 "EHLO ns.firmix.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753209AbZI1WcK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Sep 2009 18:32:10 -0400
Received: from ns.firmix.at (localhost [127.0.0.1])
	by ns.firmix.at (8.14.1/8.14.1) with ESMTP id n8SMMmKw027607
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2009 00:22:53 +0200
Received: (from defang@localhost)
	by ns.firmix.at (8.14.1/8.14.1/Submit) id n8SMMjl7027603
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Sep 2009 00:22:45 +0200
Subject: Re: 32-rc1: "CROSS_COMPILE changed" message breaks compilation
From: Bernd Petrovitsch <bernd@firmix.at>
In-Reply-To: <20090928192536.GE28514@elf.ucw.cz>
References: <20090928175605.GB28514@elf.ucw.cz>
	 <20090928190841.GA12004@merkur.ravnborg.org>
	 <20090928192536.GE28514@elf.ucw.cz>
Content-Type: text/plain
Date: Tue, 29 Sep 2009 00:22:43 +0200
Message-Id: <1254176563.2926.2.camel@gimli.petrovitsch.priv.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Sam Ravnborg <sam@ravnborg.org>, kernel list <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Hi!

On Mon, 2009-09-28 at 21:25 +0200, Pavel Machek wrote: 
[...]
> What is the recommended way to run ccache, then?
I don't know if it's the recommended way but
----  snip  ----
make CC="ccache gcc"
----  snip  ----
works for me.

Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


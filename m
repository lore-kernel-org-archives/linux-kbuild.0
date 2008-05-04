Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns.firmix.at ([62.141.48.66]:4613 "EHLO ns.firmix.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754760AbYEDKMc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 4 May 2008 06:12:32 -0400
Received: from ns.firmix.at (localhost [127.0.0.1])
	by ns.firmix.at (8.14.1/8.14.1) with ESMTP id m44ACDUZ011156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-kbuild@vger.kernel.org>; Sun, 4 May 2008 12:12:22 +0200
Received: (from defang@localhost)
	by ns.firmix.at (8.14.1/8.14.1/Submit) id m44AC9K9011145
	for <linux-kbuild@vger.kernel.org>; Sun, 4 May 2008 12:12:09 +0200
Subject: Re: kconfig - a suggestion how to fix the select issue
From: Bernd Petrovitsch <bernd@firmix.at>
In-Reply-To: <20080504071041.GA15315@uranus.ravnborg.org>
References: <20080504071041.GA15315@uranus.ravnborg.org>
Content-Type: text/plain
Date: Sun, 04 May 2008 12:12:02 +0200
Message-Id: <1209895922.4114.21.camel@gimli.at.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Sun, 2008-05-04 at 09:10 +0200, Sam Ravnborg wrote:
> Today we have two ways to express/solve dependencies.
> 
> Top-down we have "depends on"
> and bottom up we have "select".
> 
> The "depends on" dependencies at the same
> time impact the visibility of a symbol.
> A symbol with "depends on" not satisfied are not
> visible and thus not shown in menuconfig.

Perhaps this is problem: The menu item shouldn't be selectable for sure
but it may well be visible (and I'm purposely ignoring details of "how
to grey out" for the different user interfaces).
If it's visible (but not selectable) the user interface can provide the
auto-generated requirements (derived from the "depends on" chains) as
part of the "help" or where ever it seems useful. And the user at least
knows where to look further.

> The "select" method is a way to forcefully
> set the selected symbol to the same value
> as the one where the select are stated.

Which makes sense from the usability point of view for typical library
functions (e.g. zlib, CRC, ...).
But that ("which CONFIG_ variables actually selected this CONFIG_
variable" and/or "which CONFIG_ variables will selected this CONFIG_
variable") could also be automatically generated and displayed.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


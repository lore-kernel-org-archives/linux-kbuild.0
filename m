Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0243.hostedemail.com ([216.40.44.243]:35743 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755778AbdEGVqu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 17:46:50 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 495044C3E
        for <linux-kbuild@vger.kernel.org>; Sun,  7 May 2017 17:01:42 +0000 (UTC)
Message-ID: <1494176499.31950.34.camel@perches.com>
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
From: Joe Perches <joe@perches.com>
Date: Sun, 07 May 2017 10:01:39 -0700
In-Reply-To: <20170507145609.4395-1-n54@gmx.com>
References: <20170507145609.4395-1-n54@gmx.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kamil Rytarowski <n54@gmx.com>, linux-kbuild@vger.kernel.org
Cc: apw@canonical.com

On Sun, 2017-05-07 at 16:56 +0200, Kamil Rytarowski wrote:
> The default NetBSD package manager is pkgsrc and it installs Perl
> along other third party programs under custom and configurable prefix.
> The default prefix for binary prebuilt packages is /usr/pkg, and the
> Perl executable lands in /usr/pkg/bin/perl.
> 
> This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it's
> the most portable solution that should work for almost everybody.
> Perl's executable is detected automatically.
> 
> This change switches -w option passed to the executable with more
> modern "use warnings;" approach. There is no functional change to the
> default behavior.

Functionality would then depend on user $PATH.
Better?  <shrug>

For the perl "-w", adding "use warnings;" instead of
"-w" seems sensible enough.  Is any build environment
using a perl version below 5.6?


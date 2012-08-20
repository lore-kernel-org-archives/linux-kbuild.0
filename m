Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:43726 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751972Ab2HTDLR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 19 Aug 2012 23:11:17 -0400
Received: by obbuo13 with SMTP id uo13so8912458obb.19
        for <linux-kbuild@vger.kernel.org>; Sun, 19 Aug 2012 20:11:17 -0700 (PDT)
Message-ID: <5031AAD1.6090504@landley.net>
Date: Sun, 19 Aug 2012 22:11:13 -0500
From: Rob Landley <rob@landley.net>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts/kernel-doc: drop maintainer
References: <50219DD4.7020406@xenotime.net>
In-Reply-To: <50219DD4.7020406@xenotime.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: linux-kbuild@vger.kernel.org, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

On 08/07/2012 05:59 PM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@xenotime.net>
> 
> Drop maintainership of scripts/kernel-doc.
> Patches can go thru the kbuild tree.

If it wasn't perl I'd volunteer to take it over, but it's perl.

Rob
-- 
GNU/Linux isn't: Linux=GPLv2, GNU=GPLv3+, they can't share code.
Either it's "mere aggregation", or a license violation.  Pick one.

Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:36876 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750821Ab0CENNO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Mar 2010 08:13:14 -0500
Message-ID: <4B910367.5040303@suse.cz>
Date: Fri, 05 Mar 2010 14:13:11 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg md5sums
References: <4B901ECD.5080707@joco.name>
In-Reply-To: <4B901ECD.5080707@joco.name>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: FEJES Jozsef <fejes@joco.name>
Cc: linux-kbuild@vger.kernel.org

On 4.3.2010 21:57, FEJES Jozsef wrote:
> I would like an md5sums file in the packages built by the deb-pkg 
> script. It's a quite standard and useful thing to do.
> 
> Please consider my patch (or something similar) for inclusion.
> 
> My patch does the same thing as dh_md5sums, without any fancy options 
> which are unnecessary in this case.

Hi,

Please submit a patch according to Documentation/SubmittingPatches, i.e.
inline it in the body of the email and include your Signed-off-by: line.
BTW:
sh -c "cd '$pdir'; find . -type f ! -path './DEBIAN/*' -printf '%P\0'
can be written as
find "$pdir" -path "$pdir/DEBIAN" -prune -o -type f -printf '%P\0'
(saves you some quoting).

Michal

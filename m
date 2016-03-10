Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:33677 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752865AbcCJRuF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Mar 2016 12:50:05 -0500
Message-ID: <56E1B3C5.7040204@gmail.com>
Date: Thu, 10 Mar 2016 23:19:57 +0530
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ld-version: Fix awk regex compile failure
References: <1457455673-12219-1-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1457455673-12219-1-git-send-email-james.hogan@imgtec.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>, Ralf Baechle <ralf@linux-mips.org>, Michal Marek <mmarek@suse.com>, Andi Kleen <ak@linux.intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, linux-mips@linux-mips.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org

On Tuesday 08 March 2016 10:17 PM, James Hogan wrote:
> The ld-version.sh script fails on some versions of awk with the
> following error, resulting in build failures for MIPS:
>
> awk: scripts/ld-version.sh: line 4: regular expression compile failed (missing '(')
>
> This is due to the regular expression ".*)", meant to strip off the
> beginning of the ld version string up to the close bracket, however
> brackets have a meaning in regular expressions, so lets escape it so
> that awk doesn't expect a corresponding open bracket.
>
> Fixes: ccbef1674a15 ("Kbuild, lto: add ld-version and ld-ifversion ...")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: James Hogan <james.hogan@imgtec.com>

This error was only coming in my gitlab builds but was not showing in 
the build of travis-ci. Maybe it depends on the version of awk also.
Build log at: https://gitlab.com/sudipm/linux-next/builds/839573

Tested-by: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>

regards
sudip


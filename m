Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0031.hostedemail.com ([216.40.44.31]:47100 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726299AbfCHOUZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Mar 2019 09:20:25 -0500
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id B5CD9180013ED
        for <linux-kbuild@vger.kernel.org>; Fri,  8 Mar 2019 14:13:56 +0000 (UTC)
Message-ID: <10c498eede0b780af7bbea9ae4f9848e74d9da55.camel@perches.com>
Subject: Re: [PATCH v1 4/5] scripts: checkpatch.pl: don't complain that
 debian/rules is executable
From: Joe Perches <joe@perches.com>
Date: Fri, 08 Mar 2019 06:13:52 -0800
In-Reply-To: <1552049064-32044-5-git-send-email-info@metux.net>
References: <1552049064-32044-1-git-send-email-info@metux.net>
         <1552049064-32044-5-git-send-email-info@metux.net>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, apw@canonical.com, linux-kbuild@vger.kernel.org, linux-riscv@lists.infradead.org

On Fri, 2019-03-08 at 13:44 +0100, Enrico Weigelt, metux IT consult wrote:
> checkpatch.pl complains when adding executable "debian/rules",
> obviously a false alarm. Therefore add an exception for that.

This is predicated on a debian/ directory actually being added
to the generic kernel tree.

I'm not sure that's a good idea.

As debian/ does not currently exist in the generic kernel source,
I think this can be kept locally in their tree if they choose.

> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -2576,6 +2576,7 @@ sub process {
>  		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
>  			my $permhere = $here . "FILE: $realfile\n";
>  			if ($realfile !~ m@scripts/@ &&
> +			    $realfile !~ "debian/rules" &&
>  			    $realfile !~ /\.(py|pl|awk|sh)$/) {
>  				ERROR("EXECUTE_PERMISSIONS",
>  				      "do not set execute permissions for source files\n" . $permhere);

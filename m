Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33614 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751665AbbHTMGd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 08:06:33 -0400
Subject: Re: [PATCH v2 1/1] merge_config.sh: exit on missing input files
References: <400239d8e6d962b6bb752136ac9eef704f1eb31f.1437369135.git.sam.bobroff@au1.ibm.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55D5C2C7.7060002@suse.cz>
Date: Thu, 20 Aug 2015 14:06:31 +0200
MIME-Version: 1.0
In-Reply-To: <400239d8e6d962b6bb752136ac9eef704f1eb31f.1437369135.git.sam.bobroff@au1.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Bobroff <sam.bobroff@au1.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On 2015-07-20 07:12, Sam Bobroff wrote:
> Add a check for the existence of input files and exit (with failure)
> if they are missing.
> 
> Without this additional check, missing files produce error messages
> but still result in an output file being generated and a successful
> exit code.
> 
> Signed-off-by: Sam Bobroff <sam.bobroff@au1.ibm.com>

Thanks, applied to kbuild.git#kconfig.


> Additionally, it seems like it might be a good idea (either with or
> without this patch) to add "set -e" to the script because this patch
> only handles missing files, not other errors (which will currently be
> ignored and return a successful exit code). Should I add this to the
> patch?

I'd prefer proper error handling over set -e. set -e usually bites you
when you expect it the least, e.g. inside the loop at the end of the script:

	REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
	ACTUAL_VAL=$(grep -w -e "$CFG" $OUTPUT/.config)

The second grep call can return 1, but in this case we want to report
the difference.

Michal

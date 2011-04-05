Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:51066 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754618Ab1DESMQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 14:12:16 -0400
Message-ID: <4D9B5B81.3060404@suse.cz>
Date: Tue, 05 Apr 2011 20:12:17 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [08/34] initramfs: Use KBUILD_BUILD_TIMESTAMP for generated entries
References: <1302015561-21047-9-git-send-email-mmarek@suse.cz> <gen-initramfs-timestamp@mdm.bga.com>
In-Reply-To: <gen-initramfs-timestamp@mdm.bga.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Milton Miller <miltonm@bga.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

Dne 5.4.2011 19:31, Milton Miller napsal(a):
> On Tue, 05 Apr 2011 about 14:58:55 -0000, Michal Marek wrote:
>>
>> gen_init_cpio uses the current time for symlinks, special files and
>> directories.
>
> gen_init_cpio gets the current time and uses it for each symlink,
> special file, and directory.
>
> Grab the current time once, and ...
>
>> Make it possible to override this with the
> (s/this/it/)
>> KBUILD_BUILD_TIMESTAMP variable for reproducible builds.
>>
...
>> +	env = getenv("CPIO_TIMESTAMP");
>> +	if (env)
>> +		default_mtime = atol(env);
>> +	if (!default_mtime)
>> +		default_mtime = time(NULL);
>> +
>
> Please pass it via an explicit flag in argv instead of magic env variables.
>
> The other current use of the environment (the expansion of variables
> in the location name) is via explicit reference in the input file.
>
> Also, please use strol and check that the whole string is consumed.

Yeah, I was too lazy. I'll do it properly in v2.

Thanks for the review.

Michal

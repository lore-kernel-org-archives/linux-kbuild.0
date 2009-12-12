Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:52513 "HELO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S933838AbZLMBlN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 12 Dec 2009 20:41:13 -0500
In-Reply-To: <1260615744-23165-1-git-send-email-mmarek@suse.cz>
References: <1260615744-23165-1-git-send-email-mmarek@suse.cz>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <BECBC631-3E9B-48EF-AA08-5C37806C4A7D@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] modpost: fix segfault with short symbol names
Date: Sat, 12 Dec 2009 16:26:20 +0100
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org

> memcmp() is wrong here, the symbol name can be shorter than  
> KSYMTAB_PFX
> or CRC_PFX.

> -		if (memcmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
> +		if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {

This doesn't change anything.  In both cases the function will return 0
only if all strlen(CRC_PFX) chars match, and in both cases it can access
strlen(CRC_PFX) chars (strncmp() is allowed to access characters after
the first \0 just fine).


Segher


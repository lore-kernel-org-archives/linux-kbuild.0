Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kingswood-consulting.co.uk ([88.97.16.53]:36517 "EHLO
	andromeda.kingswood-consulting.co.uk" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754985Ab2DXHdl (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Apr 2012 03:33:41 -0400
Message-ID: <4F965753.8070600@kingswood-consulting.co.uk>
Date: Tue, 24 Apr 2012 08:33:39 +0100
From: "Frank A. Kingswood" <frank@kingswood-consulting.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH] user-specified temporary directory for deb-pkg
References: <4F8C12FC.4010102@kingswood-consulting.co.uk> <4F95A67A.9060002@suse.cz>
In-Reply-To: <4F95A67A.9060002@suse.cz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

On 23/04/12 19:59, Michal Marek wrote:
> Dne 16.4.2012 14:39, Frank Kingswood napsal(a):
>> The Debian package build can be very slow when running against a slow
>> NFS server. This patch allows the user to set the BUILDTMP environment
>> variable to move these temporaries somewhere local.
>>
>> The user can simply use make O=/some/directory .....
Thanks for the follow-up.

That's not the same thing. Building in-place is fine, I only want the 
deb-pkg temporaries in RAM disk.

If I use "make O=/dev/shm/somewhere/" then the whole tree is re-built 
into the new empty directory (as well as requiring me to copy over the 
.config).

Frank

-- 
------------------------------------------------------------------------
Frank A. Kingswood                      frank@kingswood-consulting.co.uk
Cambridge, United Kingdom                               +44-7545-209 100


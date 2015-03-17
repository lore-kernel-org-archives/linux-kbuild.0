Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ie0-f172.google.com ([209.85.223.172]:33240 "EHLO
	mail-ie0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932151AbbCQQZI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Mar 2015 12:25:08 -0400
MIME-Version: 1.0
In-Reply-To: <1426596002-26128-2-git-send-email-quentin.casasnovas@oracle.com>
References: <1426596002-26128-1-git-send-email-quentin.casasnovas@oracle.com>
	<1426596002-26128-2-git-send-email-quentin.casasnovas@oracle.com>
Date: Tue, 17 Mar 2015 09:25:07 -0700
Message-ID: <CA+55aFzOJMmeXQM0rwnfxvkjRnOXYGKTeY_uXK9p4mp8-fTUUw@mail.gmail.com>
Subject: Re: [PATCH 1/7] modpost: add strict white-listing when referencing sections.
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Casasnovas <quentin.casasnovas@oracle.com>, Rusty Russell <rusty@rustcorp.com.au>, Michal Marek <mmarek@suse.cz>
Cc: lkml <linux-kernel@vger.kernel.org>, Oleg Nesterov <oleg@redhat.com>, Borislav Petkov <bp@alien8.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Mar 17, 2015 at 5:39 AM, Quentin Casasnovas
<quentin.casasnovas@oracle.com> wrote:
> Prints a warning when a section references a section outside a strict
> white-list.  This will be useful to print a warning if __ex_table
> references a non-executable section.

So I think all of these patches are ok, but you should probably add a
few more people explicitly to the cc.

Probably Rusty (because modpost) and MIchal (because kbuild). The
kernel mailing list is so high-volume and untargeted that it's usually
better as a "archival cc" than as a way to find people to comment and
merge the patches.

                        Linus

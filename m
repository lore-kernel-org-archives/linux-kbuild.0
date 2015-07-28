Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48587 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751187AbbG1Tyf (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Jul 2015 15:54:35 -0400
Subject: Re: [PATCH] builddeb: sign the modules after splitting out the
 debuginfo files
References: <1434421046-4020-1-git-send-email-tytso@mit.edu>
 <CAAqcGHkcmFxPtCxnNgdoKyPerZXQSVpQ-FVWz7PU01TF=rzMbA@mail.gmail.com>
 <20150728192706.GP2851@thunk.org>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <55B7DDF8.7080309@suse.cz>
Date: Tue, 28 Jul 2015 21:54:32 +0200
MIME-Version: 1.0
In-Reply-To: <20150728192706.GP2851@thunk.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Riku Voipio <riku.voipio@linaro.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 28.7.2015 v 21:27 Theodore Ts'o napsal(a):
> On Wed, Jun 17, 2015 at 09:34:34AM +0300, Riku Voipio wrote:
>> Hi,
>>
>> On 16 June 2015 at 05:17, Theodore Ts'o <tytso@mit.edu> wrote:
>>> Signed-off-by: Theodore Ts'o <tytso@mit.edu>
>>
>> A similar patch is already in Michals tree:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/mmarek/kbuild.git/commit/?h=misc&id=64178cb62c329350fe06622cd215264d849b27b1
>>
> 
> It looks like kbuild.git didn't get merged for the 4.2 merge cycle?

Yes. Linus did not merge the misc branch, because he was missing there
another patch which in fact is in a different subsystem tree :-/.

Michal


Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57129 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932907AbbD1KFV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 28 Apr 2015 06:05:21 -0400
Message-ID: <553F5B5F.5000709@suse.cz>
Date: Tue, 28 Apr 2015 12:05:19 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] builddeb: parallelize debug module installation
References: <553E4633.8080606@suse.cz>	<1430153019-31596-1-git-send-email-chris.j.arges@canonical.com> <CAAqcGHm_WN+E1_EZ52FWfGzbWZX6=7_WRiUv_SU3rU794_mgag@mail.gmail.com>
In-Reply-To: <CAAqcGHm_WN+E1_EZ52FWfGzbWZX6=7_WRiUv_SU3rU794_mgag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>, Chris J Arges <chris.j.arges@canonical.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org

On 2015-04-28 10:57, Riku Voipio wrote:
> On 27 April 2015 at 19:43, Chris J Arges <chris.j.arges@canonical.com> wrote:
>> When building the dbg package, we use a large 'for module in $(find' loop that
>> can be easily parallelized by using 'find | xargs'. This patch modifies this
>> loop to use the later paradigm.
>>
>> In addition, ensure we add '-n1 -P0' to xargs to run as many processes as
>> possible.
>>
>> Signed-off-by: Chris J Arges <chris.j.arges@canonical.com>
>> ---
>>  scripts/package/builddeb | 15 ++++++++-------
>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>
>> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
>> index 88dbf23..538f829 100755
>> --- a/scripts/package/builddeb
>> +++ b/scripts/package/builddeb
>> @@ -152,16 +152,17 @@ if grep -q '^CONFIG_MODULES=y' $KCONFIG_CONFIG ; then
>>                 rmdir "$tmpdir/lib/modules/$version"
>>         fi
>>         if [ -n "$BUILD_DEBUG" ] ; then
>> -               for module in $(find $tmpdir/lib/modules/ -name *.ko -printf '%P\n'); do
>> -                       module=lib/modules/$module
>> -                       mkdir -p $(dirname $dbg_dir/usr/lib/debug/$module)
>> +               find $tmpdir/lib/modules/ -name *.ko -printf '%P\n' | xargs -n1 -P0 -I {} sh -c '
> 
> I would go with -P`getconf _NPROCESSORS_ONLN`. There can be thousands
> of modules (allmodconfig will make 4500).

Yep. I was thinking about retrieving the value of the make -j argument
somehow, but this is not possible and we certainly do not want to
implement the jobserver protocol in shell :-). So using the number of
processors is a sensible choice. What can be done is to detect whether
the -j option is in MAKEFLAGS and only then use multiple instances.

Michal

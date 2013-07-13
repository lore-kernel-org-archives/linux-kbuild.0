Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f53.google.com ([74.125.82.53]:58169 "EHLO
	mail-wg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932571Ab3GMOQc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 13 Jul 2013 10:16:32 -0400
Received: by mail-wg0-f53.google.com with SMTP id y10so9144692wgg.32
        for <linux-kbuild@vger.kernel.org>; Sat, 13 Jul 2013 07:16:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130713125431.GA3280@free.fr>
References: <1373667977-8034-1-git-send-email-chauplac@gmail.com>
	<20130713125431.GA3280@free.fr>
Date: Sat, 13 Jul 2013 16:16:30 +0200
Message-ID: <CACW0xKVUS2uQp5MgwUC=Pt+yr-vwN7eRw6ZYspJfmP6ZC1R8=g@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/config: use sed's POSIX interface
From: =?ISO-8859-1?Q?Cl=E9ment_Chauplannaz?= <chauplac@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, mmarek@suse.cz, ak@linux.intel.com

Yann,

Thanks (once more!) for the careful review. See my answers inline.

2013/7/13 Yann E. MORIN <yann.morin.1998@free.fr>:
> Clément, All,
>
> On 2013-07-13 00:26 +0200, Clement Chauplannaz spake thusly:
>> Script `config' relies on extensions of `GNU sed', and is thus not
>> working on all Unixes:
>> - in-place edition of files (-i), which can be replaced with
>> a temporary file;
>> - extended-regexps (-r), which can be split into basic regexps;
>> - single-line calls to `a' command, while some implementations
>> require a leading newline before the parameter.
>
> Just nit-picking on the commit log: can you indent the bullet-list, and
> the continuation lines, so it is easier to read, like:
>   - in-place edition of files (-i), which can be replaced with
>     a temporary file;
Ack. Applied.

>> Rewrite calls to `sed' to comply with POSIX interface, and move them
>> to helper functions.
>>
>> Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>
> [--SNIP--]
>> +txt_append() {
>> +     local anchor="$1"
>> +     local insert="$2"
>> +     local infile="$3"
>> +     local outfile="$4"
>> +
>> +     # sed append cmd: 'a\' + newline + text + newline
>> +     cmd="$(printf "a\\%b$insert%b" "\n" "\n")"
>
> It seems I've managed the same with a simpler construct:
>     cmd="$(printf "a$insert\n")"
This does work with GNU-sed, but not with BSD-sed which does require
separating the command character 'a' from its argument with a
backslash (as per sed's POSIX definition).

>> +     sed -e "/$anchor/$cmd" "$infile" >"$outfile"
>
> Why don't you handle the temp file in the helpers?
> (OK, I got it later, see below.)
This makes it clearer indeed. Applied.

>
> [--SNIP--]
>>  set_var() {
>>       local name=$1 new=$2 before=$3
>>
>>       name_re="^($name=|# $name is not set)"
>>       before_re="^($before=|# $before is not set)"
>>       if test -n "$before" && grep -Eq "$before_re" "$FN"; then
>> -             sed -ri "/$before_re/a $new" "$FN"
>> +             txt_append "^$before=" "$new" "$FN" "$FN.swp"
>> +             txt_append "^# $before is not set" "$new" "$FN.swp" "$FN"
>
> What about doing it in a single run:
>     txt_append "^\($before=\|# $before is not set\)" [...]
This also works with GNU-sed, but not with BSD-sed. Alternation
(matching either one of the strings separated by the vertical line) is
not supported in Basic Regular Expressions; this is a GNU-sed
extension.

>> +             rm "$FN.swp"
>
> OK, this is sneaky. Since you use two calls, you use arg-swapping in the
> second call so that the temp file is the source and the actual file is
> the destination. That made me wonder why on Earth you would just 'rm'
> that tempfile without doing anything with it. Sneaky, I almost missed
> that. At least, put in a comment when using such tricks.
>
> Besides, that won't work if you do it all in one pass, as shown above.
>
> So:
>   - do the munging in one pass
Cannot apply, for the reasons exposed above.
>   - move handling the temp file in the helpers
Ack. Done.

>>       elif grep -Eq "$name_re" "$FN"; then
>> -             sed -ri "s:$name_re.*:$new:" "$FN"
>> +             txt_subst "^$name=.*" "$new" "$FN" "$FN.swp"
>> +             txt_subst "^# $name is not set" "$new" "$FN.swp" "$FN"
>> +             rm "$FN.swp"
>
> Ditto (one pass & temp file).
Ack.
>
>>       else
>>               echo "$new" >>"$FN"
>>       fi
>> @@ -77,7 +110,9 @@ set_var() {
>>  undef_var() {
>>       local name=$1
>>
>> -     sed -ri "/^($name=|# $name is not set)/d" "$FN"
>> +     txt_delete "^$name=" "$FN" "$FN.swp"
>> +     txt_delete "^# $name is not set" "$FN.swp" "$FN"
>> +     rm "$FN.swp"
>
> Ditto (one pass &  temp file).
Ack.
>
> Regards,
> Yann E. MORIN.

I will send a v3 with the changes listed above.

Thanks & regards,
Clement

/*
 * Copyright (c) 2014, Oracle and/or its affiliates. All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 *   - Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   - Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in the
 *     documentation and/or other materials provided with the distribution.
 *
 *   - Neither the name of Oracle nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 * This source code is provided to illustrate the usage of a given feature
 * or technique and has been deliberately simplified. Additional steps
 * required for a production-quality application, such as security checks,
 * input validation and proper error handling, might not be present in
 * this sample code.
 */
import javax.xml.bind.ValidationException;
import java.util.function.Supplier;

/**
 * Enum of Validator implementations.
 */
public enum Validator {

    /**
     * This validator checks that the string represents an integer.
     */
    INTEGER_NUMBER {
                /**
                 * Checks that the string represents an integer.
                 *
                 * @param string - a string supplier
                 * @throws ValidationException if the validation check fails
                 */
                @Override
                void validate(Supplier<?> string) throws ValidationException {
                    try {
                        Integer.parseInt((String) string.get());
                    } catch (NumberFormatException ex) {
                        throw new ValidationException("Error while validating "
                                + string.get());
                    }
                }
            },
    /**
     * This validator checks that the string represents a positive number.
     */
    POSITIVE_NUMBER {
                /**
                 * Checks that the string represents a positive number.
                 *
                 * @param string - an string supplier
                 * @throws ValidationException if the validation check fails
                 */
                @Override
                void validate(Supplier<?> string) throws ValidationException {
                    try {
                        if (Double.compare(0.0, Double.parseDouble(
                                        (String) string.get())) > 0) {
                            throw new Exception();
                        }
                    } catch (Exception ex) {
                        throw new ValidationException("Error while validating "
                                + string.get());
                    }
                }
            };

    /**
     * Checks that the supplier is valid.
     *
     * @param string - a string supplier
     * @throws ValidationException if validation check fails
     */
    abstract void validate(Supplier<?> string) throws ValidationException;

}
